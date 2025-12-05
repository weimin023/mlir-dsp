#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @padding1d(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: index) -> memref<?xf32> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = affine.apply #map()[%dim, %arg1]
    %alloc = memref.alloc(%0) {alignment = 64 : i64} : memref<?xf32>
    scf.for %arg2 = %c0 to %0 step %c1 {
      memref.store %cst, %alloc[%arg2] : memref<?xf32>
    }
    %subview = memref.subview %alloc[0] [%dim] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    return %alloc : memref<?xf32>
  }
  func.func @elementwise_mul(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    scf.for %arg2 = %c0 to %dim step %c1 {
      %1 = memref.load %arg0[%arg2] : memref<?xf32, strided<[?], offset: ?>>
      %2 = memref.load %arg1[%arg2] : memref<?xf32, strided<[?], offset: ?>>
      %3 = arith.mulf %1, %2 : f32
      memref.store %3, %arg0[%arg2] : memref<?xf32, strided<[?], offset: ?>>
    }
    %0 = bufferization.clone %arg0 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
    return %0 : memref<?xf32, strided<[?], offset: ?>>
  }
  func.func @dynamic_padding_and_mul_filter_auto_reuse(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?xf32, strided<[?], offset: ?>>, %arg2: index) -> memref<?xf32> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = affine.apply #map()[%dim, %arg2]
    %alloc = memref.alloc(%0) {alignment = 64 : i64} : memref<?xf32>
    scf.for %arg3 = %c0 to %0 step %c1 {
      memref.store %cst, %alloc[%arg3] : memref<?xf32>
    }
    %subview = memref.subview %alloc[0] [%dim] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    scf.for %arg3 = %c0 to %0 step %c1 {
      %1 = memref.load %alloc[%arg3] : memref<?xf32>
      %2 = memref.load %arg1[%arg3] : memref<?xf32, strided<[?], offset: ?>>
      %3 = arith.mulf %1, %2 : f32
      memref.store %3, %alloc[%arg3] : memref<?xf32>
    }
    return %alloc : memref<?xf32>
  }
}

