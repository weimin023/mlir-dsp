#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
module {
  func.func @tosa_fft(%arg0: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x1x8xf32>, memref<1x1x8xf32>) {
    %cst = arith.constant 8.000000e+00 : f32
    %cst_0 = arith.constant 6.28318548 : f32
    %c8 = arith.constant 8 : index
    %cst_1 = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    linalg.fill ins(%cst_1 : f32) outs(%alloc : memref<1x1x8xf32>)
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    linalg.fill ins(%cst_1 : f32) outs(%alloc_2 : memref<1x1x8xf32>)
    linalg.generic {indexing_maps = [#map, #map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) outs(%alloc, %alloc_2 : memref<1x1x8xf32>, memref<1x1x8xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32, %out_4: f32):
      %0 = linalg.index 2 : index
      %1 = linalg.index 4 : index
      %2 = index.mul %1, %0
      %3 = index.remu %2, %c8
      %4 = arith.index_castui %3 : index to i32
      %5 = arith.uitofp %4 : i32 to f32
      %6 = arith.divf %5, %cst : f32
      %7 = arith.addf %6, %cst_1 : f32
      %8 = arith.mulf %7, %cst_0 : f32
      %9 = math.cos %8 : f32
      %10 = math.sin %8 : f32
      %11 = arith.mulf %in, %9 : f32
      %12 = arith.mulf %in_3, %10 : f32
      %13 = arith.addf %11, %12 : f32
      %14 = arith.mulf %in_3, %9 : f32
      %15 = arith.mulf %in, %10 : f32
      %16 = arith.subf %14, %15 : f32
      %17 = arith.addf %out, %13 : f32
      %18 = arith.addf %out_4, %16 : f32
      linalg.yield %17, %18 : f32, f32
    }
    return %alloc, %alloc_2 : memref<1x1x8xf32>, memref<1x1x8xf32>
  }
}

