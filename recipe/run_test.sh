#!/bin/bash

# Stop on first error
set -ex

# Try compiling example using CMake
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
make
./test-cmake
