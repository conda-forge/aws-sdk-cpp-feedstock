#!/bin/sh

set -e

mv cmake/compiler_settings.cmake cmake/compiler_settings.cmake.orig
# Remove setting Werror explicitly.
grep -v Werror cmake/compiler_settings.cmake.orig > cmake/compiler_settings.cmake

mkdir build && cd build

cmake ${CMAKE_ARGS} .. -GNinja \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_MODULE_PATH="${PREFIX}/lib/cmake" \
  -DBUILD_ONLY='s3;core;transfer;config;identity-management;sts;sqs;sns;monitoring;logs;secretsmanager' \
  -DCMAKE_POLICY_DEFAULT_CMP0075=NEW \
  -DENABLE_UNITY_BUILD=ON \
  -DENABLE_TESTING=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_DEPS=OFF \
  -DCURL_HAS_H2=ON \
  -DCURL_HAS_TLS_PROXY=ON \

ninja install
