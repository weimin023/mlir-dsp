include "mlir/IR/OpBase.td"

def DSPDialect : Dialect {
  let name = "dsp";
  let cppNamespace = "::mlir::dsp";
  let summary = "DSP Dialect";
}
