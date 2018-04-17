cmake_minimum_required (VERSION 3.5)
project (project_name)
# The version number.
set (project_name_VERSION_MAJOR 1)
set (project_name_VERSION_MINOR 0)
 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")
 
# add the executable
add_executable(project_name project_name.cxx)
