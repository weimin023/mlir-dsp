#ifndef MLIR_DSP_DSPPASSES_TD
#define MLIR_DSP_DSPPASSES_TD

include "mlir/Pass/PassBase.td"

def DSPToGPUPass : Pass<"dsp-to-gpu", "mlir::ModuleOp"> {
  let summary = "Lower DSP ops to GPU dialect";
  let description = "This pass lowers DSP ops to GPU dialect operations.";
}

def FFT1DToGPUPass : Pass<"fft1d-to-gpu", "mlir::ModuleOp"> {
  let summary = "Lower dsp.fft1d operations to GPU dialect";
  let description = "This pass lowers dsp.fft1d operations to GPU dialect operations.";
  let dependentDialects = ["mlir::dsp::DSPDialect"];
}

#endif // MLIR_DSP_DSPPASSES_TD