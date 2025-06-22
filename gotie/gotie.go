package main

/*
#include <stdlib.h>
extern void bye_gotie(void);
typedef void (*closure)();  // https://golang.org/issue/19835
*/
import "C"

import (
	"fmt"

	"gopkg.in/gookit/color.v1"
)

// import "os"
// import "github.com/fatih/color"

// import "github.com/muesli/termenv"
// import "image/color"

// unfortunately we have to make this func visible
//
//export bye_gotie
func bye_gotie() {
	gocolor := color.RGB(17, 171, 182)
	fmt.Printf("Bye from %s!\n", gocolor.Sprint("Go"))
}

//export hello_gotie
func hello_gotie() {
	// output := termenv.NewOutput(os.Stdout)
	// output := termenv.NewOutput(os.Stdout, termenv.WithProfile(termenv.TrueColor))
	// fmt.Fprintf(color.Output, "Hello from %s!\n", color.CyanString("Go"))
	// gocolor := color.RGB(0, 171, 214)
	gocolor := color.RGB(17, 171, 182)
	// gocolor := color.RGBA{17, 171, 182, 255}
	fmt.Printf("Hello from %s!\n", gocolor.Sprint("Go"))
	// gostr := output.String("Go")
	// gostr.Foreground(output.FromColor(gocolor))
	// fmt.Printf("Hello from %s!\n", gostr)
	C.atexit(C.closure(C.bye_gotie))
}

func main() {}
