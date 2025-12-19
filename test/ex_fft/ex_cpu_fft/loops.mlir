module {
  func.func @tosa_fft(%arg0: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x1x8xf32>, memref<1x1x8xf32>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 8.000000e+00 : f32
    %cst_0 = arith.constant 6.28318548 : f32
    %c8 = arith.constant 8 : index
    %cst_1 = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    scf.for %arg2 = %c0 to %c1 step %c1 {
      scf.for %arg3 = %c0 to %c1 step %c1 {
        scf.for %arg4 = %c0 to %c8 step %c1 {
          memref.store %cst_1, %alloc[%arg2, %arg3, %arg4] : memref<1x1x8xf32>
        }
      }
    }
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    scf.for %arg2 = %c0 to %c1 step %c1 {
      scf.for %arg3 = %c0 to %c1 step %c1 {
        scf.for %arg4 = %c0 to %c8 step %c1 {
          memref.store %cst_1, %alloc_2[%arg2, %arg3, %arg4] : memref<1x1x8xf32>
        }
      }
    }
    scf.for %arg2 = %c0 to %c1 step %c1 {
      scf.for %arg3 = %c0 to %c1 step %c1 {
        scf.for %arg4 = %c0 to %c8 step %c1 {
          scf.for %arg5 = %c0 to %c1 step %c1 {
            scf.for %arg6 = %c0 to %c8 step %c1 {
              %0 = memref.load %arg0[%arg2, %arg5, %arg6] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
              %1 = memref.load %arg1[%arg2, %arg5, %arg6] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
              %2 = memref.load %alloc[%arg2, %arg3, %arg4] : memref<1x1x8xf32>
              %3 = memref.load %alloc_2[%arg2, %arg3, %arg4] : memref<1x1x8xf32>
              %4 = index.mul %arg6, %arg4
              %5 = index.remu %4, %c8
              %6 = arith.index_castui %5 : index to i32
              %7 = arith.uitofp %6 : i32 to f32
              %8 = arith.divf %7, %cst : f32
              %9 = arith.addf %8, %cst_1 : f32
              %10 = arith.mulf %9, %cst_0 : f32
              %11 = math.cos %10 : f32
              %12 = math.sin %10 : f32
              %13 = arith.mulf %0, %11 : f32
              %14 = arith.mulf %1, %12 : f32
              %15 = arith.addf %13, %14 : f32
              %16 = arith.mulf %1, %11 : f32
              %17 = arith.mulf %0, %12 : f32
              %18 = arith.subf %16, %17 : f32
              %19 = arith.addf %2, %15 : f32
              %20 = arith.addf %3, %18 : f32
              memref.store %19, %alloc[%arg2, %arg3, %arg4] : memref<1x1x8xf32>
              memref.store %20, %alloc_2[%arg2, %arg3, %arg4] : memref<1x1x8xf32>
            }
          }
        }
      }
    }
    return %alloc, %alloc_2 : memref<1x1x8xf32>, memref<1x1x8xf32>
  }
}

