using System.Runtime.InteropServices;
using Pastel;
using System.Drawing;
using System.Runtime.CompilerServices;

namespace sharpie;

// https://medium.com/@sixpeteunder/how-to-build-a-shared-library-in-c-sharp-and-call-it-from-java-code-6931260d01e5
// $ dotnet new create classlib --output . && mv Class1.cs Sharpie.cs
public static class Sharpie
{
    public static event EventHandler? ProcessExit;

    [UnmanagedCallersOnly(EntryPoint = "hello_sharpie", CallConvs = new[] { typeof(CallConvCdecl) })]
    public static void HelloSharpie() {
        // Ignore NO_COLOR and other envs
        Pastel.ConsoleExtensions.Enable();
        // Color - right triangle of the logo
        Console.WriteLine($"Hello from {"C#".Pastel(Color.FromArgb(129, 44, 151))}!");
        // AppDomain.CurrentDomain.ProcessExit and DomainUnload don't work out of the box
        // and I failed to trigger them manually, so here is a custom solution
        ProcessExit += (_, _) => 
        {
            Pastel.ConsoleExtensions.Enable();
            Console.WriteLine($"Bye from {"C#".Pastel(Color.FromArgb(129, 44, 151))}!");
        };
    }

    // TODO: Use c atexit approach?
    [UnmanagedCallersOnly(EntryPoint = "exit_csharp", CallConvs = new[] { typeof(CallConvCdecl) })]
    public static void ExitCSharp() {
        ProcessExit?.Invoke(null, EventArgs.Empty);
    }
}
