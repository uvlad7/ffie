package main

import "C"

import "fmt"
// import "github.com/fatih/color"
import "gopkg.in/gookit/color.v1"

//export hello
func hello() {
    // fmt.Fprintf(color.Output, "Hello from %s!\n", color.CyanString("Go"))
    // gocolor := color.RGB(0, 171, 214)
    gocolor := color.RGB(17, 171, 182)
    fmt.Printf("Hello from %s!\n", gocolor.Sprint("Go"))
}

func main() {}
