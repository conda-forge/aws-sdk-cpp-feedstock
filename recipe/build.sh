#!/bin/sh

set -e

mkdir build-shared && cd build-shared

cmake ${CMAKE_ARGS} .. -GNinja \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_ONLY='s3;core;transfer;config;identity-management;sts' \
  -DENABLE_UNITY_BUILD=ON \
  -DENABLE_TESTING=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_DEPS=OFF \
  -DCURL_HAS_H2=ON \
  -DCURL_HAS_TLS_PROXY=ON \
  -DBUILD_SHARED_LIBS=ON

ninja install

cd .. && mkdir build-static && cd build-static

cmake ${CMAKE_ARGS} .. -GNinja \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_ONLY='s3;core;transfer;config;identity-management;sts' \
  -DENABLE_UNITY_BUILD=ON \
  -DENABLE_TESTING=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_DEPS=OFF \
  -DCURL_HAS_H2=ON \
  -DCURL_HAS_TLS_PROXY=ON \
  -DBUILD_SHARED_LIBS=OFF

ninja install
