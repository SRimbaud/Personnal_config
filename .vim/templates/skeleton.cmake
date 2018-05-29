cmake_minimum_required (VERSION 3.5)
project (project_name)
# The version number.
set (project_name_VERSION_MAJOR 1)
set (project_name_VERSION_MINOR 0)

set (CMAKE_CXX_STANDARD 11)

set(project_target project_name)
 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${CMAKE_SOURCE_DIR}/inc ${CMAKE_SOURCE_DIR}/include")
 
# add the executable
add_executable(${project_target} main.cxx)
