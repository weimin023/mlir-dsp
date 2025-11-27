#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @padding1d(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: i32) -> memref<?xf32> {
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.subi %0, %dim : index
    %dim_0 = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %2 = affine.apply #map()[%dim_0, %1]
    %alloc = memref.alloc(%2) {alignment = 64 : i64} : memref<?xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%3: index):  // 2 preds: ^bb0, ^bb2
    %4 = arith.cmpi slt, %3, %2 : index
    cf.cond_br %4, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    memref.store %cst, %alloc[%3] : memref<?xf32>
    %5 = arith.addi %3, %c1 : index
    cf.br ^bb1(%5 : index)
  ^bb3:  // pred: ^bb1
    %dim_1 = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %subview = memref.subview %alloc[0] [%dim_1] [1] : memref<?xf32> to memref<?xf32, strided<[1]>>
    memref.copy %arg0, %subview : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[1]>>
    return %alloc : memref<?xf32>
  }
}

