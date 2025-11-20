#ifndef MLIR_DSP_DSPDIALECT_H
#define MLIR_DSP_DSPDIALECT_H

#include "mlir/IR/Dialect.h"

namespace mlir {
namespace dsp {

class DSPDialect;

} // namespace dsp
} // namespace mlir

// 使用 TableGen 產生的宣告
#define GET_DIALECT_DECL
#include "mlir-dsp/DSPDialect.h.inc"

#endif // MLIR_DSP_DSPDIALECT_H