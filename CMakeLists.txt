cmake_minimum_required(VERSION 4.4)

project(3dviewer LANGUAGES CXX)

# Global for now
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_subdirectory(sources/window)
add_subdirectory(sources/app)