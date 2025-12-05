#map = affine_map<()[s0, s1] -> (s0 + s1)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @padding1d(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: index) -> memref<?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = affine.apply #map()[%dim, %arg1]
    %alloc = memref.alloc(%0) {alignment = 64 : i64} : memref<?xf32>
    linalg.map outs(%alloc : memref<?xf32>)
      (%init: f32) {
        linalg.yield %cst : f32
      }
    %subview = memref.subview %alloc[0] [%dim] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    return %alloc : memref<?xf32>
  }
  func.func @elementwise_mul(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>> {
    linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel"]} ins(%arg0, %arg1 : memref<?xf32, strided<[?], offset: ?>>, memref<?xf32, strided<[?], offset: ?>>) outs(%arg0 : memref<?xf32, strided<[?], offset: ?>>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    }
    %0 = bufferization.clone %arg0 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
    return %0 : memref<?xf32, strided<[?], offset: ?>>
  }
  func.func @dynamic_padding_and_mul_filter_auto_reuse(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?xf32, strided<[?], offset: ?>>, %arg2: index) -> memref<?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = affine.apply #map()[%dim, %arg2]
    %alloc = memref.alloc(%0) {alignment = 64 : i64} : memref<?xf32>
    linalg.map outs(%alloc : memref<?xf32>)
      (%init: f32) {
        linalg.yield %cst : f32
      }
    %subview = memref.subview %alloc[0] [%dim] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel"]} ins(%alloc, %arg1 : memref<?xf32>, memref<?xf32, strided<[?], offset: ?>>) outs(%alloc : memref<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      linalg.yield %1 : f32
    }
    return %alloc : memref<?xf32>
  }
}

