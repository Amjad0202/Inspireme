cmake_minimum_required(VERSION 3.15)
project(inspireme LANGUAGES CXX)

set(FIREBASE_CPP_SDK_DIR "${CMAKE_CURRENT_SOURCE_DIR}/firebase_cpp_sdk")
add_subdirectory(${FIREBASE_CPP_SDK_DIR})