# CMake 프로그램의 최소 버전
cmake_minimum_required(VERSION 3.28)

# 프로젝트 정보
project(
  "Viv C++ Project"
  VERSION 1.0
  DESCRIPTION
    "The 'build-all' instructions for all examples for the CMake Best Practices"
  LANGUAGES CXX
  )
MESSAGE(${CMAKE_PROJECT_NAME})

include(CTest)

add_executable(VivProject main.cpp)
