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
 
# import terminal
# import termtools
import nimcolor
# import paint

proc hello_nimmie(): void {.exportc, dynlib, cdecl.} =
  # is needed https://forum.nim-lang.org/t/7291 for this
  # https://github.com/iffy/termtools/blob/7c4cc7e0fb309989aabf52a5c20ae84ea1821864/src/termtools/color.nim#L85
  # to work
  # enableTrueColors()
  # echo "Hello from ", "Nim".fgColor("#eec643"), "!"
  echo "Hello from ", "&eec643;Nim".color, "!"
  # echo "Hello from ", ("Nim" @ "#EEC643"), "!"

proc exit_nim() {.unload_time.} =
  GC_FullCollect()
