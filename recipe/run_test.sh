#!/bin/bash

# Stop on first error
set -ex

# Try compiling example using CMake
mkdir build && cd build
cmake ..
make
./test-cmake
