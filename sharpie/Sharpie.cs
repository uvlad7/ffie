using System.Runtime.InteropServices;
using Pastel;
using System.Drawing;
using System.Runtime.CompilerServices;

namespace sharpie;

// https://medium.com/@sixpeteunder/how-to-build-a-shared-library-in-c-sharp-and-call-it-from-java-code-6931260d01e5
// $ dotnet new create classlib --output . && mv Class1.cs Sharpie.cs
public static class Sharpie
{
    [UnmanagedCallersOnly(EntryPoint = "hello_sharpie", CallConvs = new[] { typeof(CallConvCdecl) })]
    public static void HelloSharpie() {
        // Color - right triangle of the logo
        Console.WriteLine($"Hello from {"C#".Pastel(Color.FromArgb(129, 44, 151))}!");
    }
}
