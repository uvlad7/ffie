#include "library.h"

#include <iostream>
#include <sstream>
#define OOF_IMPL
#include "oof.h"

void hello_cpptie() {
    auto color = [](const std::string &text, int r, int g, int b) {
        std::ostringstream res;
        res << oof::fg_color({ r, g, b }) << text << oof::reset_formatting();
        return res.str();
    };
    // Color - bottom triangle of the logo
    std::cout << "Hello from " << color("C++", 100, 153, 209) << "!" << std::endl;
}
