#include "library.h"

#include <iostream>
#include <sstream>
#define OOF_IMPL
#include "oof.h"


// https://stackoverflow.com/questions/65055168/how-do-i-create-a-manipulator-with-a-parameter

struct color_string {
    const std::string &text;
    int r, g, b;
};

color_string color(const std::string &text, int r, int g, int b)
{
    return color_string{text, r, g, b};
};

std::ostream& operator<<(std::ostream& stream, const color_string& in)
{
    stream << oof::fg_color({ in.r, in.g, in.b }) << in.text << oof::reset_formatting();
    return stream;
}

void hello_cpptie() {
    // auto color = [](const std::string &text, int r, int g, int b) {
    //     std::ostringstream res;
    //     res << oof::fg_color({ r, g, b }) << text << oof::reset_formatting();
    //     return res.str();
    // };
    // Color - bottom triangle of the logo
    std::cout << "Hello from " << color("C++", 100, 153, 209) << "!" << std::endl;
    std::atexit([](){ std::cout << "Bye from " << color("C++", 100, 153, 209) << "!" << std::endl; });
}
