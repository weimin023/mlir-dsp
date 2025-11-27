module {
  func.func @padding1d(%arg0: tensor<?xf32>, %arg1: i32) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.subi %0, %dim : index
    %padded = tensor.pad %arg0 low[0] high[%1] {
    ^bb0(%arg2: index):
      tensor.yield %cst : f32
    } : tensor<?xf32> to tensor<?xf32>
    return %padded : tensor<?xf32>
  }
}

