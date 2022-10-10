cmake_minimum_required (VERSION "3.10")

project ("Host")

include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(${PROJECT_SOURCE_DIR}/src)

file (GLOB_RECURSE SRC_FILES src/*.c)
file (GLOB_RECURSE INC_FILES include/*.h src/*.h)
# file (GLOB_RECURSE TXT_FILES  src/*.txx)
add_executable("${PROJECT_NAME}" extract_raw_data.c ${SRC_FILES} ${INC_FILES})
