#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @padding1d(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: index) -> memref<?xf32> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = affine.apply #map()[%dim, %arg1]
    %alloc = memref.alloc(%0) {alignment = 64 : i64} : memref<?xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%1: index):  // 2 preds: ^bb0, ^bb2
    %2 = arith.cmpi slt, %1, %0 : index
    cf.cond_br %2, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    memref.store %cst, %alloc[%1] : memref<?xf32>
    %3 = arith.addi %1, %c1 : index
    cf.br ^bb1(%3 : index)
  ^bb3:  // pred: ^bb1
    %subview = memref.subview %alloc[0] [%dim] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    return %alloc : memref<?xf32>
  }
  func.func @elementwise_mul(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
    %1 = arith.cmpi slt, %0, %dim : index
    cf.cond_br %1, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %2 = memref.load %arg0[%0] : memref<?xf32, strided<[?], offset: ?>>
    %3 = memref.load %arg1[%0] : memref<?xf32, strided<[?], offset: ?>>
    %4 = arith.mulf %2, %3 : f32
    memref.store %4, %arg0[%0] : memref<?xf32, strided<[?], offset: ?>>
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb1(%5 : index)
  ^bb3:  // pred: ^bb1
    %6 = bufferization.clone %arg0 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
    return %6 : memref<?xf32, strided<[?], offset: ?>>
  }
  func.func @dynamic_padding_and_mul_filter_auto_reuse(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?xf32, strided<[?], offset: ?>>, %arg2: index) -> memref<?xf32> {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = affine.apply #map()[%dim, %arg2]
    %alloc = memref.alloc(%0) {alignment = 64 : i64} : memref<?xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%1: index):  // 2 preds: ^bb0, ^bb2
    %2 = arith.cmpi slt, %1, %0 : index
    cf.cond_br %2, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    memref.store %cst, %alloc[%1] : memref<?xf32>
    %3 = arith.addi %1, %c1 : index
    cf.br ^bb1(%3 : index)
  ^bb3:  // pred: ^bb1
    %subview = memref.subview %alloc[0] [%dim] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    cf.br ^bb4(%c0 : index)
  ^bb4(%4: index):  // 2 preds: ^bb3, ^bb5
    %5 = arith.cmpi slt, %4, %0 : index
    cf.cond_br %5, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %6 = memref.load %alloc[%4] : memref<?xf32>
    %7 = memref.load %arg1[%4] : memref<?xf32, strided<[?], offset: ?>>
    %8 = arith.mulf %6, %7 : f32
    memref.store %8, %alloc[%4] : memref<?xf32>
    %9 = arith.addi %4, %c1 : index
    cf.br ^bb4(%9 : index)
  ^bb6:  // pred: ^bb4
    return %alloc : memref<?xf32>
  }
}

