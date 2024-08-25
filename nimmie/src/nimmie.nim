# https://peterme.net/dynamic-libraries-in-nim.html
proc NimMain() {.cdecl, importc.}

# https://github.com/nim-lang/RFCs/issues/538#issuecomment-1776664357
# https://github.com/mratsim/constantine/blob/master/constantine/platforms/loadtime_functions.nim
import std/macros

const GCC_Compatible* = defined(gcc) or defined(clang) or defined(llvm_gcc) or defined(icc)

macro loadTime*(procAst: untyped): untyped =
  ## This allows a function to be called at program or library load time
  ## Note: such a function cannot be dead-code eliminated.

  procAst.addPragma(ident"used")     # Remove unused warning
  procAst.addPragma(ident"exportc")  # Prevent the proc from being dead-code eliminated

  if GCC_Compatible:
    # {.pragma: gcc_constructor, codegenDecl: "__attribute__((constructor)) $# $#$#".}
    let gcc_constructor =
        nnkExprColonExpr.newTree(
          ident"codegenDecl",
          newLit"__attribute__((constructor)) $# $#$#"
        )
    procAst.addPragma(gcc_constructor) # Implement load-time functionality

    result = procAst
  else:
    error "Compiler not supported."

macro unloadTime*(procAst: untyped): untyped =
  ## This allows a function to be called at program or library unload time
  ## Note: such a function cannot be dead-code eliminated.

  procAst.addPragma(ident"used")     # Remove unused warning
  procAst.addPragma(ident"exportc")  # Prevent the proc from being dead-code eliminated

  if GCC_Compatible:
    # {.pragma: gcc_destructor, codegenDecl: "__attribute__((destructor)) $# $#$#".}
    let gcc_destructor =
        nnkExprColonExpr.newTree(
          ident"codegenDecl",
          newLit"__attribute__((destructor)) $# $#$#"
        )
    procAst.addPragma(gcc_destructor) # Implement unload-time functionality

    result = procAst
  else:
    error "Compiler not supported."
 
# This is actually the same as the code generated without --noMain
# N_LIB_PRIVATE void NIM_POSIX_INIT NimMainInit(void) {
# 	NimMain();
# }

# __attribute__((constructor)) void dynlib_init(void) {
# 	NimMain();
# }
proc init_nim() {.load_time.} =
  NimMain()
 
proc hello_nimmie(): void {.exportc, dynlib, cdecl.} =
  echo "Hello from Nim!"
 
proc exit_nim() {.unload_time.} =
  GC_FullCollect()
