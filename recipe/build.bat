@echo on
setlocal EnableDelayedExpansion

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

set "LIBRARY_PREFIX_M=%LIBRARY_PREFIX:\=/%"

cmake -LAH -G "Ninja" ^
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_MODULE_PATH="%LIBRARY_PREFIX_M%/lib/cmake" ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DAWS_SDK_WARNINGS_ARE_ERRORS=OFF ^
      -DBUILD_ONLY="s3;core;transfer;config;identity-management;sts;sqs;sns;monitoring;logs;secretsmanager" ^
      -DENABLE_UNITY_BUILD=on ^
      -DENABLE_TESTING=OFF ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_DEPS=OFF ^
      -DBUILD_SHARED_LIBS=ON ^
      ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

popd
