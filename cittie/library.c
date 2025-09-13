#include "library.h"

#include <stdio.h>
#include <stdlib.h>

static void bye_cittie(void) {
    printf("Bye from \x1b[38;2;%d;%d;%dmC\x1b[0m!\n", 0, 88, 155);
}

void hello_cittie(void) {
//    printf("Hello from \x1b[38;2;%d;%d;%dmC\x1b[0m!\n", 0, 68, 129);
    // Color - right triangle of the logo
    printf("Hello from \x1b[38;2;%d;%d;%dmC\x1b[0m!\n", 0, 88, 155);
    atexit(bye_cittie);
}

int callme(void (*f)(void)) {
    atexit(f);
    return 42;
}