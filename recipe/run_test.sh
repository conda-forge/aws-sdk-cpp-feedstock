#!/bin/bash

# Stop on first error
set -e
set -x

if [ "$(uname)" == "Darwin" ]; then
    # OSX
    ${CPP} -v test.cpp -std=c++11 -I"${PREFIX}/include" -L"${PREFIX}/lib" -Wl,-rpath,"${PREFIX}/lib" -laws-cpp-sdk-core -o test-core
    ls -lah .
    chmod +x test-core
    ./test-core
else
    # Linux
    ${CPP} -v test.cpp -std=c++11 -I"${PREFIX}/include" -L"${PREFIX}/lib" -Wl,-rpath,"${PREFIX}/lib" -laws-cpp-sdk-core -o test-core
    ls -lah .
    chmod +x test-core
    ./test-core
fi
