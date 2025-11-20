cmake_minimum_required(VERSION 3.13.4)
project(mlir-dsp)

cmake_policy(SET CMP0116 NEW)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_compile_options(-g)

set(LLVM_DIR "${CMAKE_SOURCE_DIR}/../llvm-project/build/lib/cmake/llvm")
set(MLIR_DIR "${CMAKE_SOURCE_DIR}/../llvm-project/build/lib/cmake/mlir")

find_package(LLVM REQUIRED CONFIG)
find_package(MLIR REQUIRED CONFIG)

message(STATUS "Found LLVM at ${LLVM_DIR}")
message(STATUS "Found MLIR at ${MLIR_DIR}")

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

include_directories(
  ${LLVM_INCLUDE_DIRS}
  ${MLIR_INCLUDE_DIRS}
  ${PROJECT_SOURCE_DIR}/include
  ${CMAKE_BINARY_DIR}/include
)
add_subdirectory(include/mlir-dsp)
add_subdirectory(lib)

add_executable(mlir-dsp main.cpp)
add_dependencies(mlir-dsp MLIRDSPIncGen)

target_link_libraries(mlir-dsp
  PRIVATE
  MLIRDSPDsp
  MLIRIR
  MLIRSupport
  MLIRTableGen
  LLVMSupport
)