mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DBUILD_ONLY="s3;core;transfer;config" ^
      -DENABLE_TESTING:BOOL=ON ^
      -DCMAKE_BUILD_TYPE=Release ^
      ..

cmake --build . --target INSTALL --config Release

popd
