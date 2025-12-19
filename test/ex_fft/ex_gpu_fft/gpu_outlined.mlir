#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module attributes {gpu.container_module} {
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
    gpu.launch_func  @tosa_fft_kernel::@tosa_fft_kernel blocks in (%0, %c1_6, %c1_6) threads in (%1, %c1_6, %c1_6)  args(%c0 : index, %c0_3 : index, %cst_1 : f32, %alloc : memref<1x1x8xf32>)
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
    gpu.launch_func  @tosa_fft_kernel_0::@tosa_fft_kernel blocks in (%2, %c1_14, %c1_14) threads in (%3, %c1_14, %c1_14)  args(%c0_8 : index, %c0_11 : index, %cst_1 : f32, %alloc_7 : memref<1x1x8xf32>)
    %c0_15 = arith.constant 0 : index
    %c1_16 = arith.constant 1 : index
    %4 = arith.subi %c1_16, %c0_15 : index
    %c1_17 = arith.constant 1 : index
    %c0_18 = arith.constant 0 : index
    %c1_19 = arith.constant 1 : index
    %5 = arith.subi %c1_19, %c0_18 : index
    %c1_20 = arith.constant 1 : index
    %c1_21 = arith.constant 1 : index
    gpu.launch_func  @tosa_fft_kernel_1::@tosa_fft_kernel blocks in (%4, %c1_21, %c1_21) threads in (%5, %c1_21, %c1_21)  args(%c0_15 : index, %c0_18 : index, %arg0 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %alloc : memref<1x1x8xf32>, %alloc_7 : memref<1x1x8xf32>, %c8 : index, %cst : f32, %cst_1 : f32, %cst_0 : f32)
    return %alloc, %alloc_7 : memref<1x1x8xf32>, memref<1x1x8xf32>
  }
  gpu.module @tosa_fft_kernel {
    gpu.func @tosa_fft_kernel(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<1x1x8xf32>) kernel {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %0 = arith.addi %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %thread_id_x : index
      affine.for %arg4 = 0 to 8 {
        affine.for %arg5 = #map(%0) to #map1(%0) {
          affine.for %arg6 = #map(%1) to #map1(%1) {
            affine.for %arg7 = #map(%arg4) to #map1(%arg4) {
              affine.store %arg2, %arg3[%arg5, %arg6, %arg7] : memref<1x1x8xf32>
            }
          }
        }
      }
      gpu.return
    }
  }
  gpu.module @tosa_fft_kernel_0 {
    gpu.func @tosa_fft_kernel(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<1x1x8xf32>) kernel {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %0 = arith.addi %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %thread_id_x : index
      affine.for %arg4 = 0 to 8 {
        affine.for %arg5 = #map(%0) to #map1(%0) {
          affine.for %arg6 = #map(%1) to #map1(%1) {
            affine.for %arg7 = #map(%arg4) to #map1(%arg4) {
              affine.store %arg2, %arg3[%arg5, %arg6, %arg7] : memref<1x1x8xf32>
            }
          }
        }
      }
      gpu.return
    }
  }
  gpu.module @tosa_fft_kernel_1 {
    gpu.func @tosa_fft_kernel(%arg0: index, %arg1: index, %arg2: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg3: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg4: memref<1x1x8xf32>, %arg5: memref<1x1x8xf32>, %arg6: index, %arg7: f32, %arg8: f32, %arg9: f32) kernel {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %0 = arith.addi %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %thread_id_x : index
      affine.for %arg10 = 0 to 8 {
        affine.for %arg11 = 0 to 1 {
          affine.for %arg12 = 0 to 8 {
            affine.for %arg13 = #map(%0) to #map1(%0) {
              affine.for %arg14 = #map(%1) to #map1(%1) {
                affine.for %arg15 = #map(%arg10) to #map1(%arg10) {
                  affine.for %arg16 = #map(%arg11) to #map1(%arg11) {
                    affine.for %arg17 = #map(%arg12) to #map1(%arg12) {
                      %2 = affine.load %arg2[%arg13, %arg16, %arg17] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
                      %3 = affine.load %arg3[%arg13, %arg16, %arg17] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
                      %4 = affine.load %arg4[%arg13, %arg14, %arg15] : memref<1x1x8xf32>
                      %5 = affine.load %arg5[%arg13, %arg14, %arg15] : memref<1x1x8xf32>
                      %6 = index.mul %arg17, %arg15
                      %7 = index.remu %6, %arg6
                      %8 = arith.index_castui %7 : index to i32
                      %9 = arith.uitofp %8 : i32 to f32
                      %10 = arith.divf %9, %arg7 : f32
                      %11 = arith.addf %10, %arg8 : f32
                      %12 = arith.mulf %11, %arg9 : f32
                      %13 = math.cos %12 : f32
                      %14 = math.sin %12 : f32
                      %15 = arith.mulf %2, %13 : f32
                      %16 = arith.mulf %3, %14 : f32
                      %17 = arith.addf %15, %16 : f32
                      %18 = arith.mulf %3, %13 : f32
                      %19 = arith.mulf %2, %14 : f32
                      %20 = arith.subf %18, %19 : f32
                      %21 = arith.addf %4, %17 : f32
                      %22 = arith.addf %5, %20 : f32
                      affine.store %21, %arg4[%arg13, %arg14, %arg15] : memref<1x1x8xf32>
                      affine.store %22, %arg5[%arg13, %arg14, %arg15] : memref<1x1x8xf32>
                    }
                  }
                }
              }
            }
          }
        }
      }
      gpu.return
    }
  }
}

