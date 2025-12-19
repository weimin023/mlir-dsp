#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
module {
  func.func @tosa_fft(%arg0: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x1x8xf32>, memref<1x1x8xf32>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    %cst = arith.constant 0.000000e+00 : f32
    linalg.fill ins(%cst : f32) outs(%alloc : memref<1x1x8xf32>)
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    linalg.fill ins(%cst_1 : f32) outs(%alloc_0 : memref<1x1x8xf32>)
    %c1 = arith.constant 1 : index
    %c1_2 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %cst_3 = arith.constant 6.28318548 : f32
    %0 = arith.index_castui %c1_2 : index to i32
    %1 = arith.uitofp %0 : i32 to f32
    %2 = arith.index_castui %c8 : index to i32
    %3 = arith.uitofp %2 : i32 to f32
    linalg.generic {indexing_maps = [#map, #map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) outs(%alloc, %alloc_0 : memref<1x1x8xf32>, memref<1x1x8xf32>) {
    ^bb0(%in: f32, %in_5: f32, %out: f32, %out_6: f32):
      %4 = linalg.index 1 : index
      %5 = linalg.index 2 : index
      %6 = linalg.index 3 : index
      %7 = linalg.index 4 : index
      %8 = index.mul %6, %4
      %9 = index.mul %7, %5
      %10 = index.remu %8, %c1_2
      %11 = index.remu %9, %c8
      %12 = arith.index_castui %10 : index to i32
      %13 = arith.uitofp %12 : i32 to f32
      %14 = arith.index_castui %11 : index to i32
      %15 = arith.uitofp %14 : i32 to f32
      %16 = arith.divf %13, %1 : f32
      %17 = arith.divf %15, %3 : f32
      %18 = arith.addf %16, %17 : f32
      %19 = arith.mulf %cst_3, %18 : f32
      %20 = math.cos %19 : f32
      %21 = math.sin %19 : f32
      %22 = arith.mulf %in, %20 : f32
      %23 = arith.mulf %in_5, %21 : f32
      %24 = arith.addf %22, %23 : f32
      %25 = arith.mulf %in_5, %20 : f32
      %26 = arith.mulf %in, %21 : f32
      %27 = arith.subf %25, %26 : f32
      %28 = arith.addf %out, %24 : f32
      %29 = arith.addf %out_6, %27 : f32
      linalg.yield %28, %29 : f32, f32
    }
    %cast = memref.cast %alloc : memref<1x1x8xf32> to memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
    %cast_4 = memref.cast %alloc_0 : memref<1x1x8xf32> to memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
    return %alloc, %alloc_0 : memref<1x1x8xf32>, memref<1x1x8xf32>
  }
}

