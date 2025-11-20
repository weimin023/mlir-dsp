include "mlir/Interfaces/InferTypeOpInterface.td"
include "mlir/Interfaces/SideEffectInterfaces.td"
include "mlir-dsp/DSPOps.td"

def RangeCompressionOp : DSPOp<"range_compression", [
    Pure,
    DeclareOpInterfaceMethods<InferTypeOpInterface>]> {
    
        let summary = "Perform range compression";
        let description = [{
            High-level DSP operator that performs matched-filter range compression.

            Mathematically:
            output = IFFT( FFT(rx_data) * FFT(padded(tx_replica)) )

            This is a high-level semantic op. Lowering passes may decompose it into
            FFT, element-wise complex multiply, and IFFT on GPU or CPU targets.
        }];

        //===--------------------------------------------------------------------===//
        // Operands
        //===--------------------------------------------------------------------===//
        let arguments = (ins
            AnyShaped:$rx_data,      // input raw SAR data, shape [m, n]
            AnyShaped:$tx_replica,   // transmit reference waveform, shape [k]
            I32Attr:$filter_len,     // padding length for matched filter
            I32Attr:$batch_size      // number of rows processed per batch
        );

        //===--------------------------------------------------------------------===//
        // Result type
        //
        // The result should have the same shape & element type as rx_data.
        //===--------------------------------------------------------------------===//
        let results = (outs AnyShaped:$output);

        //===--------------------------------------------------------------------===//
        // Assembly format
        //===--------------------------------------------------------------------===//
        let assemblyFormat = [{
            $rx_data `,` $tx_replica attr-dict `:` type($rx_data) `,` type($tx_replica)
        }];

        //===--------------------------------------------------------------------===//
        // Type inference hook (InferTypeOpInterface)
        //===--------------------------------------------------------------------===//
        let extraClassDeclaration = [{
            static mlir::LogicalResult
            inferReturnTypes(mlir::MLIRContext *context,
                                std::optional<mlir::Location> loc,
                                mlir::ValueRange operands,
                                mlir::DictionaryAttr attrs,
                                mlir::RegionRange,
                                llvm::SmallVectorImpl<mlir::Type> &inferredTypes);
        }];
    }

def FFT1DOp : DSPOp<"fft1d", [
    Pure,
    DeclareOpInterfaceMethods<InferTypeOpInterface>]> {

        let summary = "Compute a 1-D FFT (optionally inverse) over a shaped value";
        let description = [{
            Stateless 1-D complex FFT operator. Later passes can map this to 
            backend-specific FFT libraries or hardware accelerators.
        }];

        let arguments = (ins
            AnyShaped:$input,
            I64Attr:$axis,
            UnitAttr:$inverse  // presence indicates inverse FFT
        );

        let results = (outs AnyShaped:$output);

        let assemblyFormat = [{
            $input attr-dict `:` type($input)
        }];

        let extraClassDeclaration = [{
            static mlir::LogicalResult
            inferReturnTypes(mlir::MLIRContext *context,
                             std::optional<mlir::Location> loc,
                             mlir::ValueRange operands,
                             mlir::DictionaryAttr attrs,
                             mlir::RegionRange,
                             llvm::SmallVectorImpl<mlir::Type> &inferredTypes);
        }];
}