include "mlir/IR/OpBase.td"
include "mlir-dsp/DSPDialect.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

// Base class for all DSP dialect operations.
class DSPOp<string mnemonic, list<Trait> traits = []>
    : Op<DSPDialect, mnemonic, traits>;