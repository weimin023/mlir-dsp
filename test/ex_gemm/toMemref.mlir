module {
  func.func @naive_gemm(%arg0: memref<?x?xf16>, %arg1: memref<?x?xf16>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf16>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?xf16>
    %dim_1 = memref.dim %arg0, %c1 : memref<?x?xf16>
    affine.for %arg3 = 0 to %dim {
      affine.for %arg4 = 0 to %dim_0 {
        affine.for %arg5 = 0 to %dim_1 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<?x?xf16>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<?x?xf16>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<?x?xf32>
          %3 = arith.extf %0 : f16 to f32
          %4 = arith.extf %1 : f16 to f32
          %5 = arith.mulf %3, %4 : f32
          %6 = arith.addf %2, %5 : f32
          affine.store %6, %arg2[%arg3, %arg4] : memref<?x?xf32>
        }
      }
    }
    return
  }
}

