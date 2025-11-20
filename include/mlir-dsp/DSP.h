#ifndef MLIR_DSP_DSP_H
#define MLIR_DSP_DSP_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/Interfaces/InferTypeOpInterface.h"


#define GET_OP_CLASSES
#include "mlir-dsp/DSP.h.inc"
#undef GET_OP_CLASSES

#endif // MLIR_DSP_DSP_H