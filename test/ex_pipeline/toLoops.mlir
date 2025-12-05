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
    scf.for %arg2 = %c0 to %c9 step %c1 {
      scf.for %arg3 = %c0 to %c9 step %c1 {
        memref.store %cst, %alloc[%arg2, %arg3] : memref<9x9xf32>
      }
    }
    %subview = memref.subview %alloc[2, 2] [5, 5] [1, 1] : memref<9x9xf32> to memref<5x5xf32, strided<[9, 1], offset: 20>>
    memref.copy %arg0, %subview : memref<5x5xf32, strided<[?, ?], offset: ?>> to memref<5x5xf32, strided<[9, 1], offset: 20>>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<7x7xf32>
    scf.for %arg2 = %c0 to %c7 step %c1 {
      scf.for %arg3 = %c0 to %c7 step %c1 {
        memref.store %cst, %alloc_0[%arg2, %arg3] : memref<7x7xf32>
      }
    }
    scf.for %arg2 = %c0 to %c7 step %c1 {
      scf.for %arg3 = %c0 to %c7 step %c1 {
        scf.for %arg4 = %c0 to %c3 step %c1 {
          scf.for %arg5 = %c0 to %c3 step %c1 {
            %0 = affine.apply #map(%arg2, %arg4)
            %1 = affine.apply #map(%arg3, %arg5)
            %2 = memref.load %alloc[%0, %1] : memref<9x9xf32>
            %3 = memref.load %arg1[%arg4, %arg5] : memref<3x3xf32, strided<[?, ?], offset: ?>>
            %4 = memref.load %alloc_0[%arg2, %arg3] : memref<7x7xf32>
            %5 = arith.mulf %2, %3 : f32
            %6 = arith.addf %4, %5 : f32
            memref.store %6, %alloc_0[%arg2, %arg3] : memref<7x7xf32>
          }
        }
      }
    }
    scf.for %arg2 = %c0 to %c9 step %c1 {
      scf.for %arg3 = %c0 to %c9 step %c1 {
        memref.store %cst, %alloc[%arg2, %arg3] : memref<9x9xf32>
      }
    }
    %subview_1 = memref.subview %alloc[1, 1] [7, 7] [1, 1] : memref<9x9xf32> to memref<7x7xf32, strided<[9, 1], offset: 10>>
    memref.copy %alloc_0, %subview_1 : memref<7x7xf32> to memref<7x7xf32, strided<[9, 1], offset: 10>>
    memref.dealloc %alloc_0 : memref<7x7xf32>
    return %alloc : memref<9x9xf32>
  }
}

