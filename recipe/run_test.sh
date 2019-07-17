#!/bin/bash

# Stop on first error
set -ex

# Try compiling using CMake
mkdir build && cd build
cmake ..
make
./test-cmake
