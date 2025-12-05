#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0)[s0] -> (d0 + 16, s0)>
module {
  func.func @naive_gemm(%arg0: memref<?x?xf16>, %arg1: memref<?x?xf16>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf16>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?xf16>
    %dim_1 = memref.dim %arg0, %c1 : memref<?x?xf16>
    %c0_2 = arith.constant 0 : index
    %0 = arith.subi %dim, %c0_2 : index
    %c16 = arith.constant 16 : index
    %1 = arith.ceildivsi %0, %c16 : index
    %c0_3 = arith.constant 0 : index
    %2 = arith.subi %dim_0, %c0_3 : index
    %c16_4 = arith.constant 16 : index
    %3 = arith.ceildivsi %2, %c16_4 : index
    %c1_5 = arith.constant 1 : index
    gpu.launch blocks(%arg3, %arg4, %arg5) in (%arg9 = %1, %arg10 = %c1_5, %arg11 = %c1_5) threads(%arg6, %arg7, %arg8) in (%arg12 = %3, %arg13 = %c1_5, %arg14 = %c1_5) {
      %4 = arith.muli %c16, %arg3 : index
      %5 = arith.addi %c0_2, %4 : index
      %6 = arith.muli %c16_4, %arg6 : index
      %7 = arith.addi %c0_3, %6 : index
      affine.for %arg15 = 0 to %dim_1 step 16 {
        affine.for %arg16 = #map(%5) to min #map1(%5)[%dim] {
          affine.for %arg17 = #map(%7) to min #map1(%7)[%dim_0] {
            affine.for %arg18 = #map(%arg15) to min #map1(%arg15)[%dim_1] {
              %8 = affine.load %arg0[%arg16, %arg18] : memref<?x?xf16>
              %9 = affine.load %arg1[%arg18, %arg17] : memref<?x?xf16>
              %10 = affine.load %arg2[%arg16, %arg17] : memref<?x?xf32>
              %11 = arith.extf %8 : f16 to f32
              %12 = arith.extf %9 : f16 to f32
              %13 = arith.mulf %11, %12 : f32
              %14 = arith.addf %10, %13 : f32
              affine.store %14, %arg2[%arg16, %arg17] : memref<?x?xf32>
            }
          }
        }
      }
      gpu.terminator
    }
    return
  }
}

