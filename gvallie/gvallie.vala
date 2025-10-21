// https://vanat.github.io/
// https://wiki.gnome.org/Projects(2f)Vala(2f)SharedLibSample.html


// using Posix;

namespace GVallie {
    void bye() {
        stdout.printf("Bye from \x1b[38;2;%d;%d;%dmGObject Vala\x1b[0m!\n", 138, 82, 201);
    }
    
    public void hello() {
        stdout.printf("Hello from \x1b[38;2;%d;%d;%dmGObject Vala\x1b[0m!\n", 138, 82, 201);
        Posix.atexit(bye);
    }
}
