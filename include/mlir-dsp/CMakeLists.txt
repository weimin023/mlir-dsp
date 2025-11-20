# Dialect
add_mlir_dialect(DSP dsp)

#===----------------------------------------------------------------------===#
# Pass generation (TableGen)
#===----------------------------------------------------------------------===#

set(LLVM_TARGET_DEFINITIONS DSPPasses.td)
mlir_tablegen(DSPPasses.h.inc -gen-pass-decls)
add_public_tablegen_target(MLIRDSPPassesIncGen)