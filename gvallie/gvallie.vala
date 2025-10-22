// https://vanat.github.io/
// https://wiki.gnome.org/Projects(2f)Vala(2f)SharedLibSample.html


// using Posix;

namespace GVallie {
    void bye_gvallie() {
        stdout.printf("Bye from \x1b[38;2;%d;%d;%dmVala\x1b[0m/\x1b[38;2;%d;%d;%dmGO\x1b[0m\x1b[38;2;%d;%d;%dmbje\x1b[0m\x1b[38;2;%d;%d;%dmct\x1b[0m!\n", 138, 82, 201, 114, 158, 206, 227, 0, 0, 127, 230, 25);
    }
    
    public void hello_gvallie() {
        stdout.printf("Hello from \x1b[38;2;%d;%d;%dmVala\x1b[0m/\x1b[38;2;%d;%d;%dmGO\x1b[0m\x1b[38;2;%d;%d;%dmbje\x1b[0m\x1b[38;2;%d;%d;%dmct\x1b[0m!\n", 138, 82, 201, 114, 158, 206, 227, 0, 0, 127, 230, 25);
        Posix.atexit(bye_gvallie);
    }
}
