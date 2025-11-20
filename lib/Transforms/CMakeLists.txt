#===----------------------------------------------------------------------===#
# Pass Library
#===----------------------------------------------------------------------===#
add_mlir_library(MLIRDSPPasses
  DSPPasses.cpp
  LowerFFT2GPU.cpp

  DEPENDS
    MLIRDSPPassesIncGen
)

