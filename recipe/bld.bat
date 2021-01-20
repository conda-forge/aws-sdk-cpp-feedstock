setlocal EnableDelayedExpansion

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -LAH -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DBUILD_ONLY="s3;core;transfer;config;identity-management;sts" ^
      -DENABLE_UNITY_BUILD=on ^
      -DENABLE_TESTING=OFF ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_DEPS=OFF ^
      -DBUILD_SHARED_LIBS=ON ^
      -DFORCE_CURL=ON ^
      -DCURL_HAS_H2=ON ^
      -DCURL_HAS_TLS_PROXY=ON ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd
