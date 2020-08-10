# Minimal CMakeLists.txt for the AWS SDK for C++
cmake_minimum_required(VERSION 3.2)

project(my-example)

# Locate the AWS SDK for C++ package.
find_package(AWSSDK REQUIRED COMPONENTS config s3 transfer
             identity-management sts)

add_executable(test-cmake test.cpp)

target_link_libraries(test-cmake ${AWSSDK_LINK_LIBRARIES})
