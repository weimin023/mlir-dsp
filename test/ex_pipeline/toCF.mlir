#map = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @pipeline(%arg0: memref<5x5xf32, strided<[?, ?], offset: ?>>, %arg1: memref<3x3xf32, strided<[?, ?], offset: ?>>) -> memref<9x9xf32> {
    %c3 = arith.constant 3 : index
    %c7 = arith.constant 7 : index
    %c1 = arith.constant 1 : index
    %c9 = arith.constant 9 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<9x9xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb5
    %1 = arith.cmpi slt, %0, %c9 : index
    cf.cond_br %1, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%2: index):  // 2 preds: ^bb2, ^bb4
    %3 = arith.cmpi slt, %2, %c9 : index
    cf.cond_br %3, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %alloc[%0, %2] : memref<9x9xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb3(%4 : index)
  ^bb5:  // pred: ^bb3
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb1(%5 : index)
  ^bb6:  // pred: ^bb1
    %subview = memref.subview %alloc[2, 2] [5, 5] [1, 1] : memref<9x9xf32> to memref<5x5xf32, strided<[9, 1], offset: 20>>
    memref.copy %arg0, %subview : memref<5x5xf32, strided<[?, ?], offset: ?>> to memref<5x5xf32, strided<[9, 1], offset: 20>>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<7x7xf32>
    cf.br ^bb7(%c0 : index)
  ^bb7(%6: index):  // 2 preds: ^bb6, ^bb11
    %7 = arith.cmpi slt, %6, %c7 : index
    cf.cond_br %7, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    cf.br ^bb9(%c0 : index)
  ^bb9(%8: index):  // 2 preds: ^bb8, ^bb10
    %9 = arith.cmpi slt, %8, %c7 : index
    cf.cond_br %9, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %cst, %alloc_0[%6, %8] : memref<7x7xf32>
    %10 = arith.addi %8, %c1 : index
    cf.br ^bb9(%10 : index)
  ^bb11:  // pred: ^bb9
    %11 = arith.addi %6, %c1 : index
    cf.br ^bb7(%11 : index)
  ^bb12:  // pred: ^bb7
    cf.br ^bb13(%c0 : index)
  ^bb13(%12: index):  // 2 preds: ^bb12, ^bb23
    %13 = arith.cmpi slt, %12, %c7 : index
    cf.cond_br %13, ^bb14, ^bb24
  ^bb14:  // pred: ^bb13
    cf.br ^bb15(%c0 : index)
  ^bb15(%14: index):  // 2 preds: ^bb14, ^bb22
    %15 = arith.cmpi slt, %14, %c7 : index
    cf.cond_br %15, ^bb16, ^bb23
  ^bb16:  // pred: ^bb15
    cf.br ^bb17(%c0 : index)
  ^bb17(%16: index):  // 2 preds: ^bb16, ^bb21
    %17 = arith.cmpi slt, %16, %c3 : index
    cf.cond_br %17, ^bb18, ^bb22
  ^bb18:  // pred: ^bb17
    cf.br ^bb19(%c0 : index)
  ^bb19(%18: index):  // 2 preds: ^bb18, ^bb20
    %19 = arith.cmpi slt, %18, %c3 : index
    cf.cond_br %19, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %20 = affine.apply #map(%12, %16)
    %21 = affine.apply #map(%14, %18)
    %22 = memref.load %alloc[%20, %21] : memref<9x9xf32>
    %23 = memref.load %arg1[%16, %18] : memref<3x3xf32, strided<[?, ?], offset: ?>>
    %24 = memref.load %alloc_0[%12, %14] : memref<7x7xf32>
    %25 = arith.mulf %22, %23 : f32
    %26 = arith.addf %24, %25 : f32
    memref.store %26, %alloc_0[%12, %14] : memref<7x7xf32>
    %27 = arith.addi %18, %c1 : index
    cf.br ^bb19(%27 : index)
  ^bb21:  // pred: ^bb19
    %28 = arith.addi %16, %c1 : index
    cf.br ^bb17(%28 : index)
  ^bb22:  // pred: ^bb17
    %29 = arith.addi %14, %c1 : index
    cf.br ^bb15(%29 : index)
  ^bb23:  // pred: ^bb15
    %30 = arith.addi %12, %c1 : index
    cf.br ^bb13(%30 : index)
  ^bb24:  // pred: ^bb13
    cf.br ^bb25(%c0 : index)
  ^bb25(%31: index):  // 2 preds: ^bb24, ^bb29
    %32 = arith.cmpi slt, %31, %c9 : index
    cf.cond_br %32, ^bb26, ^bb30
  ^bb26:  // pred: ^bb25
    cf.br ^bb27(%c0 : index)
  ^bb27(%33: index):  // 2 preds: ^bb26, ^bb28
    %34 = arith.cmpi slt, %33, %c9 : index
    cf.cond_br %34, ^bb28, ^bb29
  ^bb28:  // pred: ^bb27
    memref.store %cst, %alloc[%31, %33] : memref<9x9xf32>
    %35 = arith.addi %33, %c1 : index
    cf.br ^bb27(%35 : index)
  ^bb29:  // pred: ^bb27
    %36 = arith.addi %31, %c1 : index
    cf.br ^bb25(%36 : index)
  ^bb30:  // pred: ^bb25
    %subview_1 = memref.subview %alloc[1, 1] [7, 7] [1, 1] : memref<9x9xf32> to memref<7x7xf32, strided<[9, 1], offset: 10>>
    memref.copy %alloc_0, %subview_1 : memref<7x7xf32> to memref<7x7xf32, strided<[9, 1], offset: 10>>
    memref.dealloc %alloc_0 : memref<7x7xf32>
    return %alloc : memref<9x9xf32>
  }
}

