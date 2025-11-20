#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir-dsp/DSPDialect.h.inc"
#include <iostream>

int main() {
    mlir::MLIRContext context;
    std::cout << "DSPDialect.inc included successfully!" << std::endl;
    return 0;
}