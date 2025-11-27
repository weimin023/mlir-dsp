#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @padding1d(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: i32) -> memref<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.subi %0, %dim : index
    %dim_0 = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %2 = affine.apply #map()[%dim_0, %1]
    %alloc = memref.alloc(%2) {alignment = 64 : i64} : memref<?xf32>
    linalg.map outs(%alloc : memref<?xf32>)
      (%init: f32) {
        linalg.yield %cst : f32
      }
    %dim_1 = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %subview = memref.subview %alloc[0] [%dim_1] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    return %alloc : memref<?xf32>
  }
}

