add_mlir_dialect_library(MLIRDSPDsp
  DSPOps.cpp

  DEPENDS
  MLIRDSPIncGen

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRSupport
)

