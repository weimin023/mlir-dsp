#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @tosa_fft(%arg0: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x1x8xf32>, memref<1x1x8xf32>) {
    %cst = arith.constant 8.000000e+00 : f32
    %cst_0 = arith.constant 6.28318548 : f32
    %c8 = arith.constant 8 : index
    %cst_1 = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.subi %c1, %c0 : index
    %c1_2 = arith.constant 1 : index
    %c0_3 = arith.constant 0 : index
    %c1_4 = arith.constant 1 : index
    %1 = arith.subi %c1_4, %c0_3 : index
    %c1_5 = arith.constant 1 : index
    %c1_6 = arith.constant 1 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %0, %arg9 = %c1_6, %arg10 = %c1_6) threads(%arg5, %arg6, %arg7) in (%arg11 = %1, %arg12 = %c1_6, %arg13 = %c1_6) {
      %6 = arith.addi %c0, %arg2 : index
      %7 = arith.addi %c0_3, %arg5 : index
      affine.for %arg14 = 0 to 8 {
        affine.for %arg15 = #map(%6) to #map1(%6) {
          affine.for %arg16 = #map(%7) to #map1(%7) {
            affine.for %arg17 = #map(%arg14) to #map1(%arg14) {
              affine.store %cst_1, %alloc[%arg15, %arg16, %arg17] : memref<1x1x8xf32>
            }
          }
        }
      }
      gpu.terminator
    }
    %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    %c0_8 = arith.constant 0 : index
    %c1_9 = arith.constant 1 : index
    %2 = arith.subi %c1_9, %c0_8 : index
    %c1_10 = arith.constant 1 : index
    %c0_11 = arith.constant 0 : index
    %c1_12 = arith.constant 1 : index
    %3 = arith.subi %c1_12, %c0_11 : index
    %c1_13 = arith.constant 1 : index
    %c1_14 = arith.constant 1 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %2, %arg9 = %c1_14, %arg10 = %c1_14) threads(%arg5, %arg6, %arg7) in (%arg11 = %3, %arg12 = %c1_14, %arg13 = %c1_14) {
      %6 = arith.addi %c0_8, %arg2 : index
      %7 = arith.addi %c0_11, %arg5 : index
      affine.for %arg14 = 0 to 8 {
        affine.for %arg15 = #map(%6) to #map1(%6) {
          affine.for %arg16 = #map(%7) to #map1(%7) {
            affine.for %arg17 = #map(%arg14) to #map1(%arg14) {
              affine.store %cst_1, %alloc_7[%arg15, %arg16, %arg17] : memref<1x1x8xf32>
            }
          }
        }
      }
      gpu.terminator
    }
    %c0_15 = arith.constant 0 : index
    %c1_16 = arith.constant 1 : index
    %4 = arith.subi %c1_16, %c0_15 : index
    %c1_17 = arith.constant 1 : index
    %c0_18 = arith.constant 0 : index
    %c1_19 = arith.constant 1 : index
    %5 = arith.subi %c1_19, %c0_18 : index
    %c1_20 = arith.constant 1 : index
    %c1_21 = arith.constant 1 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %4, %arg9 = %c1_21, %arg10 = %c1_21) threads(%arg5, %arg6, %arg7) in (%arg11 = %5, %arg12 = %c1_21, %arg13 = %c1_21) {
      %6 = arith.addi %c0_15, %arg2 : index
      %7 = arith.addi %c0_18, %arg5 : index
      affine.for %arg14 = 0 to 8 {
        affine.for %arg15 = 0 to 1 {
          affine.for %arg16 = 0 to 8 {
            affine.for %arg17 = #map(%6) to #map1(%6) {
              affine.for %arg18 = #map(%7) to #map1(%7) {
                affine.for %arg19 = #map(%arg14) to #map1(%arg14) {
                  affine.for %arg20 = #map(%arg15) to #map1(%arg15) {
                    affine.for %arg21 = #map(%arg16) to #map1(%arg16) {
                      %8 = affine.load %arg0[%arg17, %arg20, %arg21] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
                      %9 = affine.load %arg1[%arg17, %arg20, %arg21] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
                      %10 = affine.load %alloc[%arg17, %arg18, %arg19] : memref<1x1x8xf32>
                      %11 = affine.load %alloc_7[%arg17, %arg18, %arg19] : memref<1x1x8xf32>
                      %12 = index.mul %arg21, %arg19
                      %13 = index.remu %12, %c8
                      %14 = arith.index_castui %13 : index to i32
                      %15 = arith.uitofp %14 : i32 to f32
                      %16 = arith.divf %15, %cst : f32
                      %17 = arith.addf %16, %cst_1 : f32
                      %18 = arith.mulf %17, %cst_0 : f32
                      %19 = math.cos %18 : f32
                      %20 = math.sin %18 : f32
                      %21 = arith.mulf %8, %19 : f32
                      %22 = arith.mulf %9, %20 : f32
                      %23 = arith.addf %21, %22 : f32
                      %24 = arith.mulf %9, %19 : f32
                      %25 = arith.mulf %8, %20 : f32
                      %26 = arith.subf %24, %25 : f32
                      %27 = arith.addf %10, %23 : f32
                      %28 = arith.addf %11, %26 : f32
                      affine.store %27, %alloc[%arg17, %arg18, %arg19] : memref<1x1x8xf32>
                      affine.store %28, %alloc_7[%arg17, %arg18, %arg19] : memref<1x1x8xf32>
                    }
                  }
                }
              }
            }
          }
        }
      }
      gpu.terminator
    }
    return %alloc, %alloc_7 : memref<1x1x8xf32>, memref<1x1x8xf32>
  }
}

