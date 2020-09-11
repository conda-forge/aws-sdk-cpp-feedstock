mkdir build
pushd build

cmake -G"Ninja" -DBUILD_SHARED_LIBS=ON ..
if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

test-cmake.exe
if errorlevel 1 exit 1

popd
