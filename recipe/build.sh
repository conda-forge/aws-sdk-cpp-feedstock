#!/bin/sh

set -e

mkdir build && cd build

cmake ${CMAKE_ARGS} .. -GNinja \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_ONLY='s3;core;transfer;config;identity-management;sts' \
  -DENABLE_UNITY_BUILD=on \
  -DENABLE_TESTING=off \
  -DCMAKE_BUILD_TYPE=Release

ninja
ninja install

# Ensure that /lib64 is not created or populated
LIB64=${PREFIX}/lib64
if [ -d "${LIB64}" ]; then
    echo "Error: lib64 exists!"
    ls -lA ${LIB64}
    exit 1
fi
