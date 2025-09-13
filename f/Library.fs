namespace f
// $ dotnet new create classlib --language F# --output .
module Say =
    let hello name =
        printfn "Hello %s" name
