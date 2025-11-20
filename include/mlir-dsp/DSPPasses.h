#ifndef MLIR_DSP_DSPPASSES_H
#define MLIR_DSP_DSPPASSES_H

#include "mlir/Pass/Pass.h"

namespace mlir {
namespace dsp {

// Generate declarations
#define GEN_PASS_DECL_DSPTOGPUPASS
#define GEN_PASS_DECL_FFT1DTOGPUPASS // Add declaration for the new pass
#include "mlir-dsp/DSPPasses.h.inc"

#define GEN_PASS_REGISTRATION_DSPTOGPUPASS
#define GEN_PASS_REGISTRATION_FFT1DTOGPUPASS // Add registration for the new pass
#include "mlir-dsp/DSPPasses.h.inc"

} // namespace dsp
} // namespace mlir

#endif // MLIR_DSP_DSPPASSES_H