#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0)[s0] -> (d0 + 16, s0)>
module attributes {gpu.container_module} {
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
    gpu.launch_func  @naive_gemm_kernel::@naive_gemm_kernel blocks in (%1, %c1_5, %c1_5) threads in (%3, %c1_5, %c1_5)  args(%c16 : index, %c0_2 : index, %c16_4 : index, %c0_3 : index, %arg0 : memref<?x?xf16>, %arg1 : memref<?x?xf16>, %arg2 : memref<?x?xf32>, %dim_1 : index, %dim_0 : index, %dim : index)
    return
  }
  gpu.module @naive_gemm_kernel {
    gpu.func @naive_gemm_kernel(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?x?xf16>, %arg5: memref<?x?xf16>, %arg6: memref<?x?xf32>, %arg7: index, %arg8: index, %arg9: index) kernel {
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
      %0 = arith.muli %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %0 : index
      %2 = arith.muli %arg2, %thread_id_x : index
      %3 = arith.addi %arg3, %2 : index
      affine.for %arg10 = 0 to %arg7 step 16 {
        affine.for %arg11 = #map(%1) to min #map1(%1)[%arg9] {
          affine.for %arg12 = #map(%3) to min #map1(%3)[%arg8] {
            affine.for %arg13 = #map(%arg10) to min #map1(%arg10)[%arg7] {
              %4 = affine.load %arg4[%arg11, %arg13] : memref<?x?xf16>
              %5 = affine.load %arg5[%arg13, %arg12] : memref<?x?xf16>
              %6 = affine.load %arg6[%arg11, %arg12] : memref<?x?xf32>
              %7 = arith.extf %4 : f16 to f32
              %8 = arith.extf %5 : f16 to f32
              %9 = arith.mulf %7, %8 : f32
              %10 = arith.addf %6, %9 : f32
              affine.store %10, %arg6[%arg11, %arg12] : memref<?x?xf32>
            }
          }
        }
      }
      gpu.return
    }
  }
}

