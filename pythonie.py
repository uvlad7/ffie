#!/usr/bin/env python
from cffi import FFI
import os
from colorist import ColorRGB

julitie_loader = FFI()
JulitieLib = julitie_loader.dlopen(os.path.join(os.getcwd(), 'julitie/libjulitie.so'))

julitie_loader.cdef("""
     void hello_julitie();
""")

rustie_loader = FFI()
RustieLib = rustie_loader.dlopen(os.path.join(os.getcwd(), 'rustie/librustie.so'))

rustie_loader.cdef("""
     void hello_rustie();
""")

crystie_loader = FFI()
CrystieLib = crystie_loader.dlopen(os.path.join(os.getcwd(), 'crystie/libcrystie.so'))

crystie_loader.cdef("""
     void hello_crystie();
""")

gotie_loader = FFI()
GotieLib = gotie_loader.dlopen(os.path.join(os.getcwd(), 'gotie/libgotie.so'))

gotie_loader.cdef("""
     void hello_gotie();
""")

cittie_loader = FFI()
CittieLib = cittie_loader.dlopen(os.path.join(os.getcwd(), 'cittie/libcittie.so'))

cittie_loader.cdef("""
     void hello_cittie();
""")

cpptie_loader = FFI()
CpptieLib = cpptie_loader.dlopen(os.path.join(os.getcwd(), 'cpptie/libcpptie.so'))

cpptie_loader.cdef("""
     void hello_cpptie();
""")

ziggie_loader = FFI()
ZiggieLib = ziggie_loader.dlopen(os.path.join(os.getcwd(), 'ziggie/libziggie.so'))

ziggie_loader.cdef("""
     void hello_ziggie();
""")

dittie_loader = FFI()
DittieLib = dittie_loader.dlopen(os.path.join(os.getcwd(), 'dittie/libdittie.so'))

dittie_loader.cdef("""
     void hello_dittie();
""")

swiftie_loader = FFI()
SwiftieLib = swiftie_loader.dlopen(os.path.join(os.getcwd(), 'swiftie/libswiftie.so'))

swiftie_loader.cdef("""
     void hello_swiftie();
""")

haskie_loader = FFI()
HaskieLib = haskie_loader.dlopen(os.path.join(os.getcwd(), 'haskie/libhaskie.so'))

haskie_loader.cdef("""
     void hello_haskie();
""")

lltie_loader = FFI()
LltieLib = lltie_loader.dlopen(os.path.join(os.getcwd(), 'lltie/liblltie.so'))

lltie_loader.cdef("""
     void hello_lltie();
""")

class Pythonie:
    def hello_pythonie():
        # pycolor = ColorRGB(57, 118, 170)
        pycolor = ColorRGB(246, 203, 0)
        print(f"Hello from {pycolor}Python{pycolor.OFF}!")


if __name__ == "__main__":
    RustieLib.hello_rustie()
    
    CrystieLib.hello_crystie()
    
    GotieLib.hello_gotie()

    CittieLib.hello_cittie()

    CpptieLib.hello_cpptie()

    JulitieLib.hello_julitie()

    ZiggieLib.hello_ziggie()

    DittieLib.hello_dittie()

    SwiftieLib.hello_swiftie()

    HaskieLib.hello_haskie()

    LltieLib.hello_lltie()

    Pythonie.hello_pythonie()
