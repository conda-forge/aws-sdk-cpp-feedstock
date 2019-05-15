#!/bin/bash

# Stop on first error
set -e

if [ "$(uname)" == "Darwin" ]; then
    # OSX
    ${CPP} test.cpp -std=c++11 -I"${PREFIX}/include" -L"${PREFIX}/lib" -Wl,-rpath,"${PREFIX}/lib" -laws-cpp-sdk-core -o test-core
    ./test-core
else
    # Linux
    ${CPP} test.cpp -std=c++11 -I"${PREFIX}/include" -L"${PREFIX}/lib" -Wl,-rpath,"${PREFIX}/lib" -laws-cpp-sdk-core -o test-core
    ./test-core
fi
