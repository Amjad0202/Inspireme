cmake_minimum_required(VERSION 3.15)
project(inspireme LANGUAGES CXX)

# Set the directory for the Firebase C++ SDK
set(FIREBASE_CPP_SDK_DIR "${CMAKE_CURRENT_SOURCE_DIR}/firebase_cpp_sdk")

# Add the Firebase C++ SDK as a subdirectory
add_subdirectory(${FIREBASE_CPP_SDK_DIR})

# Add your project-specific configuration here
# For example, if you have source files to compile, you can add them like this:
# add_executable(inspireme main.cpp)

# Link Firebase libraries to your project
# target_link_libraries(inspireme firebase_app firebase_auth)