#!/bin/bash

# Stop on first error
set -ex

# Try compiling example using CMake
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
./test-cmake
