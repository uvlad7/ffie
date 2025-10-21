[indent=4]

def bye_genie()
    print("Bye from \x1b[38;2;%d;%d;%dmGenie\x1b[0m!", 138, 82, 201)

def hello_genie()
    print("Hello from \x1b[38;2;%d;%d;%dmGenie\x1b[0m!", 138, 82, 201)
    Posix.atexit(bye_genie)
