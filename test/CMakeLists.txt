# Find required tools
find_program(MLIR_OPT mlir-opt REQUIRED PATHS ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)
find_program(MLIR_TRANSLATE mlir-translate REQUIRED PATHS ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)
find_program(LLC llc REQUIRED PATHS ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)

## Basic MLIR pipeline (for add, sub, mul, div functions)
#set(BASIC_MLIR ${CMAKE_CURRENT_SOURCE_DIR}/basic.mlir)
#set(S1_MLIR ${CMAKE_CURRENT_BINARY_DIR}/s1.mlir)
#set(O_LL ${CMAKE_CURRENT_BINARY_DIR}/o.ll)
#set(OUTPUT_O ${CMAKE_CURRENT_BINARY_DIR}/output.o)
#
## Tensor MLIR pipeline (for padding1d function)
#set(TENSOR_MLIR ${CMAKE_CURRENT_SOURCE_DIR}/tensor.mlir)
#set(TO_MEMREF_MLIR ${CMAKE_CURRENT_BINARY_DIR}/toMemref.mlir)
#set(TO_LOOPS_MLIR ${CMAKE_CURRENT_BINARY_DIR}/toLoops.mlir)
#set(TO_CF_MLIR ${CMAKE_CURRENT_BINARY_DIR}/toCF.mlir)
#set(TO_LLVM_MLIR ${CMAKE_CURRENT_BINARY_DIR}/toLLVM.mlir)
#set(TO_LLVM_LL ${CMAKE_CURRENT_BINARY_DIR}/toLLVM.ll)
#set(TO_LLVM_O ${CMAKE_CURRENT_BINARY_DIR}/toLLVM.o)
#
## Generate s1.mlir (basic functions)
#add_custom_command(
#  OUTPUT ${S1_MLIR}
#  COMMAND ${MLIR_OPT} ${BASIC_MLIR}
#          -convert-arith-to-llvm
#          -convert-func-to-llvm
#          -o ${S1_MLIR}
#  DEPENDS ${BASIC_MLIR}
#  COMMENT "Running mlir-opt on basic.mlir"
#)
#
## Generate o.ll (basic functions)
#add_custom_command(
#  OUTPUT ${O_LL}
#  COMMAND ${MLIR_TRANSLATE} ${S1_MLIR}
#          --mlir-to-llvmir
#          -o ${O_LL}
#  DEPENDS ${S1_MLIR}
#  COMMENT "Running mlir-translate on s1.mlir"
#)
#
## Generate output.o (basic functions)
#add_custom_command(
#  OUTPUT ${OUTPUT_O}
#  COMMAND ${LLC} ${O_LL}
#          -filetype=obj
#          -relocation-model=pic
#          -o ${OUTPUT_O}
#  DEPENDS ${O_LL}
#  COMMENT "Running llc on o.ll"
#)
#
## Tensor lowering pipeline - Step 1: Bufferize
#add_custom_command(
#  OUTPUT ${TO_MEMREF_MLIR}
#  COMMAND ${MLIR_OPT} ${TENSOR_MLIR}
#          -one-shot-bufferize="bufferize-function-boundaries=true"
#          -canonicalize
#          -o ${TO_MEMREF_MLIR}
#  DEPENDS ${TENSOR_MLIR}
#  COMMENT "Bufferizing tensor.mlir"
#)
#
## Tensor lowering pipeline - Step 2: Convert to loops
#add_custom_command(
#  OUTPUT ${TO_LOOPS_MLIR}
#  COMMAND ${MLIR_OPT} ${TO_MEMREF_MLIR}
#          -convert-linalg-to-loops
#          -o ${TO_LOOPS_MLIR}
#  DEPENDS ${TO_MEMREF_MLIR}
#  COMMENT "Converting linalg to loops"
#)
#
## Tensor lowering pipeline - Step 3: Convert to control flow
#add_custom_command(
#  OUTPUT ${TO_CF_MLIR}
#  COMMAND ${MLIR_OPT} ${TO_LOOPS_MLIR}
#          -convert-scf-to-cf
#          -o ${TO_CF_MLIR}
#  DEPENDS ${TO_LOOPS_MLIR}
#  COMMENT "Converting SCF to CF"
#)
#
## Tensor lowering pipeline - Step 4: Convert to LLVM dialect
#add_custom_command(
#  OUTPUT ${TO_LLVM_MLIR}
#  COMMAND ${MLIR_OPT} ${TO_CF_MLIR}
#          -lower-affine
#          -expand-strided-metadata
#          -convert-func-to-llvm
#          -convert-cf-to-llvm
#          -finalize-memref-to-llvm
#          -convert-arith-to-llvm
#          -reconcile-unrealized-casts
#          -canonicalize
#          -o ${TO_LLVM_MLIR}
#  DEPENDS ${TO_CF_MLIR}
#  COMMENT "Converting to LLVM dialect"
#)
#
## Tensor lowering pipeline - Step 5: Translate to LLVM IR
#add_custom_command(
#  OUTPUT ${TO_LLVM_LL}
#  COMMAND ${MLIR_TRANSLATE} ${TO_LLVM_MLIR}
#          --mlir-to-llvmir
#          -o ${TO_LLVM_LL}
#  DEPENDS ${TO_LLVM_MLIR}
#  COMMENT "Translating to LLVM IR"
#)
#
## Tensor lowering pipeline - Step 6: Compile to object file
#add_custom_command(
#  OUTPUT ${TO_LLVM_O}
#  COMMAND ${LLC} ${TO_LLVM_LL}
#          -filetype=obj
#          -relocation-model=pic
#          -o ${TO_LLVM_O}
#  DEPENDS ${TO_LLVM_LL}
#  COMMENT "Compiling toLLVM.ll to object file"
#)
#
## Build the test executable with all object files
#add_executable(test_main 
#    main.cpp 
#    mlir_runtime.cpp
#    ${OUTPUT_O}
#    ${TO_LLVM_O}
#)
#target_include_directories(test_main PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
#