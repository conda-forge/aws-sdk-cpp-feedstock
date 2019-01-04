#!/bin/sh
mkdir build && cd build
cmake \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_ONLY='s3;core;transfer;config' \
  -DENABLE_TESTING=ON \
  -DCURL_LIBRARY=${PREFIX}/lib/libcurl${SHLIB_EXT} \
  -DCURL_INCLUDE_DIR=${PREFIX}/include \
  -DCMAKE_BUILD_TYPE=Release ..
make -j${CPU_COUNT}
make install
