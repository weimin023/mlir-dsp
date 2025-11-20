#include "mlir/Pass/Pass.h"       // mlir::Pass
#include "mlir/IR/Builders.h"    // optional, for later patterns
#include "mlir/IR/BuiltinOps.h"  // for ModuleOp, etc
#include "mlir/IR/PatternMatch.h"// optional, for pattern rewriting

#include "mlir-dsp/DSPPasses.h"  // your wrapper header

namespace mlir {
namespace dsp {

#define GEN_PASS_DEF_DSPTOGPUPASS
#include "mlir-dsp/DSPPasses.h.inc"

namespace {

// DSPToGPUPass 繼承自 TableGen 生成的 base class
struct DSPToGPUPass : impl::DSPToGPUPassBase<DSPToGPUPass> {
  void runOnOperation() override {
    getOperation()->walk([](Operation *op) {
      op->emitRemark("DSPToGPUPass visiting operation");
    });
  }
};

} // end anonymous namespace

} // namespace dsp
} // namespace mlir