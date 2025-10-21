#!/usr/bin/env python
from cffi import FFI
import os
from colorist import ColorRGB
import atexit

dir = os.path.dirname(os.path.realpath(__file__))

julitie_loader = FFI()
JulitieLib = julitie_loader.dlopen(os.path.join(dir, 'julitie/libjulitie.so'))

julitie_loader.cdef("""
     void hello_julitie();
""")

rustie_loader = FFI()
RustieLib = rustie_loader.dlopen(os.path.join(dir, 'rustie/librustie.so'))

rustie_loader.cdef("""
     void hello_rustie();
""")

crystie_loader = FFI()
CrystieLib = crystie_loader.dlopen(os.path.join(dir, 'crystie/libcrystie.so'))

crystie_loader.cdef("""
     void hello_crystie();
""")

gotie_loader = FFI()
GotieLib = gotie_loader.dlopen(os.path.join(dir, 'gotie/libgotie.so'))

gotie_loader.cdef("""
     void hello_gotie();
""")

cittie_loader = FFI()
CittieLib = cittie_loader.dlopen(os.path.join(dir, 'cittie/libcittie.so'))

cittie_loader.cdef("""
     void hello_cittie();
""")

cpptie_loader = FFI()
CpptieLib = cpptie_loader.dlopen(os.path.join(dir, 'cpptie/libcpptie.so'))

cpptie_loader.cdef("""
     void hello_cpptie();
""")

sharpie_loader = FFI()
SharpieLib = sharpie_loader.dlopen(os.path.join(dir, 'sharpie/libsharpie.so'))

sharpie_loader.cdef("""
     void hello_sharpie();
""")

ziggie_loader = FFI()
ZiggieLib = ziggie_loader.dlopen(os.path.join(dir, 'ziggie/libziggie.so'))

ziggie_loader.cdef("""
     void hello_ziggie();
""")

dittie_loader = FFI()
DittieLib = dittie_loader.dlopen(os.path.join(dir, 'dittie/libdittie.so'))

dittie_loader.cdef("""
     void hello_dittie();
""")

swiftie_loader = FFI()
SwiftieLib = swiftie_loader.dlopen(os.path.join(dir, 'swiftie/libswiftie.so'))

swiftie_loader.cdef("""
     void hello_swiftie();
""")

haskie_loader = FFI()
HaskieLib = haskie_loader.dlopen(os.path.join(dir, 'haskie/libhaskie.so'))

haskie_loader.cdef("""
     void hello_haskie();
""")

lltie_loader = FFI()
LltieLib = lltie_loader.dlopen(os.path.join(dir, 'lltie/liblltie.so'))

lltie_loader.cdef("""
     void hello_lltie();
""")

nimmie_loader = FFI()
NimmieLib = nimmie_loader.dlopen(os.path.join(dir, 'nimmie/libnimmie.so'))

nimmie_loader.cdef("""
     void hello_nimmie();
""")

vallie_loader = FFI()
VallieLib = vallie_loader.dlopen(os.path.join(dir, 'vallie/libvallie.so'))

vallie_loader.cdef("""
     void hello_vallie();
""")

oddie_loader = FFI()
OddieLib = oddie_loader.dlopen(os.path.join(dir, 'oddie/liboddie.so'))

oddie_loader.cdef("""
     void hello_oddie();
""")

class Pythonie:
    def hello_pythonie():
        # pycolor = ColorRGB(57, 118, 170)
        pycolor = ColorRGB(246, 203, 0)
        print(f"Hello from {pycolor}Python{pycolor.OFF}!")
        atexit.register(lambda: print(f"Bye from {pycolor}Python{pycolor.OFF}!"))


if __name__ == "__main__":
    RustieLib.hello_rustie()
    
    CrystieLib.hello_crystie()
    
    GotieLib.hello_gotie()

    CittieLib.hello_cittie()

    CpptieLib.hello_cpptie()

    SharpieLib.hello_sharpie()

    JulitieLib.hello_julitie()

    ZiggieLib.hello_ziggie()

    DittieLib.hello_dittie()

    SwiftieLib.hello_swiftie()

    HaskieLib.hello_haskie()

    LltieLib.hello_lltie()

    NimmieLib.hello_nimmie()

    VallieLib.hello_vallie()

    OddieLib.hello_oddie()

    Pythonie.hello_pythonie()
