#include "mlir/IR/BuiltinOps.h"
#include "mlir/Pass/Pass.h"
#include "mlir/IR/Dialect.h"

#include "mlir-dsp/DSP.h"
#include "mlir-dsp/DSPDialect.h"
#include "mlir-dsp/DSPPasses.h"


namespace mlir {
namespace dsp {

// Include the generated header for FFT1DToGPUPass definition
#define GEN_PASS_DEF_FFT1DTOGPUPASS
#include "mlir-dsp/DSPPasses.h.inc" // This .h.inc now contains the definition for FFT1DToGPUPassBase


namespace {

struct FFT1DToGPUPass : impl::FFT1DToGPUPassBase<FFT1DToGPUPass> {
  void runOnOperation() override {

    // 1. Get the FFT1D ModuleOp and find dsp.fft1d operations
    ModuleOp module = getOperation();
    
    // 2. DFS traverse the module to find all dsp.fft1d operations
    // only visit dsp.fft1d operations (type-dispatch)
    module.walk([&](FFT1DOp op) {
        
    });
  }
};

} // namespace


} // namespace dsp
} // namespace mlir