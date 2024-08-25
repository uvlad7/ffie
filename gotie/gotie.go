package main

import "C"

import "fmt"
// import "os"
// import "github.com/fatih/color"
import "gopkg.in/gookit/color.v1"
// import "github.com/muesli/termenv"
// import "image/color"

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
}

func main() {}
