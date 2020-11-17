setlocal EnableDelayedExpansion

mkdir build-shared
cd build-shared

cmake -LAH -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DBUILD_ONLY="s3;core;transfer;config;identity-management;sts" ^
      -DENABLE_UNITY_BUILD=on ^
      -DENABLE_TESTING=OFF ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_DEPS=OFF ^
      -DBUILD_SHARED_LIBS=ON ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

cd ..
mkdir build-static
cd build-static

cmake -LAH -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DBUILD_ONLY="s3;core;transfer;config;identity-management;sts" ^
      -DENABLE_UNITY_BUILD=on ^
      -DENABLE_TESTING=OFF ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_DEPS=OFF ^
      -DBUILD_SHARED_LIBS=OFF ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1
