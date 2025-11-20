#include "mlir/Bytecode/BytecodeOpInterface.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/IR/Region.h"
#include "mlir/IR/ValueRange.h"
#include "mlir/Interfaces/InferTypeOpInterface.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Support/LogicalResult.h"

#define GET_OP_CLASSES
#include "mlir-dsp/DSP.h.inc"

using namespace mlir;
using namespace mlir::dsp;

LogicalResult RangeCompressionOp::inferReturnTypes(
    MLIRContext *context,
    std::optional<Location> loc,
    ValueRange operands,
    DictionaryAttr attrs,
    RegionRange regions,
    SmallVectorImpl<Type> &inferredTypes) {
    if (operands.empty())
        return failure();

    // rx_data is operand 0
    // Output has same shape and same element type as rx_data
    inferredTypes.push_back(operands.front().getType());
    return success();
}

LogicalResult FFT1DOp::inferReturnTypes(
    MLIRContext *context,
    std::optional<Location> loc,
    ValueRange operands,
    DictionaryAttr attrs,
    RegionRange regions,
    SmallVectorImpl<Type> &inferredTypes) {
    if (operands.empty())
        return failure();

    inferredTypes.push_back(operands.front().getType());
    return success();
}

