cmake_minimum_required(VERSION 3.22)
project(cpptie)

set(CMAKE_CXX_STANDARD 23)

include(FetchContent)
FetchContent_Declare(oof
        GIT_REPOSITORY git@github.com:s9w/oof.git
        GIT_TAG master)

FetchContent_MakeAvailable(oof)
include_directories("${oof_SOURCE_DIR}")

add_library(cpptie SHARED library.cpp)
