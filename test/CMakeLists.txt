# Find required tools
find_program(MLIR_OPT mlir-opt REQUIRED PATHS ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)
find_program(MLIR_TRANSLATE mlir-translate REQUIRED PATHS ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)
find_program(LLC llc REQUIRED PATHS ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)

set(BASIC_MLIR ${CMAKE_CURRENT_SOURCE_DIR}/basic.mlir)
set(S1_MLIR ${CMAKE_CURRENT_BINARY_DIR}/s1.mlir)
set(O_LL ${CMAKE_CURRENT_BINARY_DIR}/o.ll)
set(OUTPUT_O ${CMAKE_CURRENT_BINARY_DIR}/output.o)

# Generate s1.mlir
add_custom_command(
  OUTPUT ${S1_MLIR}
  COMMAND ${MLIR_OPT} ${BASIC_MLIR}
          -convert-arith-to-llvm
          -convert-func-to-llvm
          -o ${S1_MLIR}
  DEPENDS ${BASIC_MLIR}
  COMMENT "Running mlir-opt on basic.mlir"
)

# Generate o.ll
add_custom_command(
  OUTPUT ${O_LL}
  COMMAND ${MLIR_TRANSLATE} ${S1_MLIR}
          --mlir-to-llvmir
          -o ${O_LL}
  DEPENDS ${S1_MLIR}
  COMMENT "Running mlir-translate on s1.mlir"
)

# Generate output.o
add_custom_command(
  OUTPUT ${OUTPUT_O}
  COMMAND ${LLC} ${O_LL}
          -filetype=obj
          -relocation-model=pic
          -o ${OUTPUT_O}
  DEPENDS ${O_LL}
  COMMENT "Running llc on o.ll"
)

add_executable(test_main main.cpp ${OUTPUT_O})
target_include_directories(test_main PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
