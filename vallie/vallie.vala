// https://vanat.github.io/
// https://wiki.gnome.org/Projects(2f)Vala(2f)SharedLibSample.html


// using Posix;

void bye_vallie() {
    stdout.printf("Bye from \x1b[38;2;%d;%d;%dmVala\x1b[0m!\n", 138, 82, 201);
}

public void hello_vallie() {
    stdout.printf("Hello from \x1b[38;2;%d;%d;%dmVala\x1b[0m!\n", 138, 82, 201);
    Posix.atexit(bye_vallie);
}
