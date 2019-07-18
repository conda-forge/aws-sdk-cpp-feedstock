#!/bin/sh

set -e

mkdir build && cd build

cmake .. -GNinja \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_ONLY='s3;core;transfer;config' \
  -DENABLE_UNITY_BUILD=on \
  -DENABLE_TESTING=off \
  -DCMAKE_BUILD_TYPE=Release

ninja
ninja install
