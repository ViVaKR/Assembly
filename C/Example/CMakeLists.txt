cmake_minimum_required(VERSION 3.28)

project(
    "Viv C Project"
    VERSION 1.0
    DESCRIPTION
        "Example C Project For Assembly"
    LANGUAGES C
)

MESSAGE(${CMAKE_PROJECT_NAME})
include(CTEST)
include_directories(Headers Src)
add_executable(CalculateApp CalculateApp.c)
