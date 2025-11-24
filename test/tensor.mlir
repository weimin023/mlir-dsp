module {
    func.func @padding1d(%arg0: tensor<?xf32>, %arg1: i32)->tensor<?xf32> {
        %c0 = arith.constant 0 : index
        %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
        %target_len = arith.index_cast %arg1 : i32 to index
        %padding_len = arith.subi %target_len, %dim : index
        
        %cst = arith.constant 0.0 : f32
        %padded = tensor.pad %arg0 low[0] high[%padding_len] {
            ^bb0(%arg2: index):
                tensor.yield %cst : f32
        } : tensor<?xf32> to tensor<?xf32>
        return %padded: tensor<?xf32>
    }
}
