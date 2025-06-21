extern crate ansi_term;
use ansi_term::Colour;

extern "C" fn bye_rustie() {
    println!("Bye from {}!", Colour::RGB(227, 58, 37).paint("Rust"));
}

#[no_mangle]
pub unsafe extern "C" fn hello_rustie() {
    println!(
        "Hello from {}!",
        // Colour::Yellow.paint("Rust"));
        // Colour::RGB(183, 65, 14).paint("Rust"));
        // Colour::RGB(246, 76, 0).paint("Rust"));
        Colour::RGB(227, 58, 37).paint("Rust")
    );
    libc::atexit(bye_rustie);
}
