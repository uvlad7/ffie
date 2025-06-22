#include <stdlib.h>
#include "HsFFI.h"

__attribute__((constructor)) void init_haskell(void){
  int argc = 2;
  char *argv[] = { "+RTS", "-A32m", NULL };
  char **pargv = argv;

  // othervise atexit-registered funcs would crash
  atexit(hs_exit_nowait);
  // Initialize Haskell runtime
  hs_init(&argc, &pargv);

  // do any other initialization here and
  // return false if there was a problem
//   return HS_BOOL_TRUE;
}

// __attribute__((destructor)) void exit_haskell(void){
//   hs_exit();
// }
