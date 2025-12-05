module {
  func.func @pipeline(%arg0: memref<5x5xf32, strided<[?, ?], offset: ?>>, %arg1: memref<3x3xf32, strided<[?, ?], offset: ?>>) -> memref<9x9xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<9x9xf32>
    linalg.map outs(%alloc : memref<9x9xf32>)
      (%init: f32) {
        linalg.yield %cst : f32
      }
    %subview = memref.subview %alloc[2, 2] [5, 5] [1, 1] : memref<9x9xf32> to memref<5x5xf32, strided<[9, 1], offset: 20>>
    memref.copy %arg0, %subview : memref<5x5xf32, strided<[?, ?], offset: ?>> to memref<5x5xf32, strided<[9, 1], offset: 20>>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<7x7xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<7x7xf32>)
    linalg.conv_2d ins(%alloc, %arg1 : memref<9x9xf32>, memref<3x3xf32, strided<[?, ?], offset: ?>>) outs(%alloc_0 : memref<7x7xf32>)
    linalg.fill ins(%cst : f32) outs(%alloc : memref<9x9xf32>)
    %subview_1 = memref.subview %alloc[1, 1] [7, 7] [1, 1] : memref<9x9xf32> to memref<7x7xf32, strided<[9, 1], offset: 10>>
    memref.copy %alloc_0, %subview_1 : memref<7x7xf32> to memref<7x7xf32, strided<[9, 1], offset: 10>>
    memref.dealloc %alloc_0 : memref<7x7xf32>
    return %alloc : memref<9x9xf32>
  }
}

