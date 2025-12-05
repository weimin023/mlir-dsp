func.func @padding1d(%input: tensor<?xf32>, %pad_len: index) -> tensor<?xf32> {
  %c0 = arith.constant 0 : index
  %c0_f = arith.constant 0.0 : f32
  
  %padded_tensor = tensor.pad %input 
    low[%c0] high[%pad_len] {
        ^bb0(%tmp: index):
            tensor.yield %c0_f : f32
    } : tensor<?xf32> to tensor<?xf32>
    
  return %padded_tensor : tensor<?xf32>
}

func.func @elementwise_mul(%input: tensor<?xf32>, %filter: tensor<?xf32>) -> tensor<?xf32> {  
  %output_tensor = linalg.generic {
      indexing_maps = [
          affine_map<(d0) -> (d0)>,
          affine_map<(d0) -> (d0)>,
          affine_map<(d0) -> (d0)>
      ], 
      iterator_types = ["parallel"]
  } ins(%input, %filter : tensor<?xf32>, tensor<?xf32>) outs(%input : tensor<?xf32>) {
      ^bb1(%in_val: f32, %filter_val: f32, %out_val: f32):
      %new_val = arith.mulf %in_val, %filter_val : f32
      linalg.yield %new_val : f32
  } -> tensor<?xf32>
  
  return %output_tensor : tensor<?xf32>
}

func.func @dynamic_padding_and_mul_filter_auto_reuse(%input: tensor<?xf32>, %filter: tensor<?xf32>, %pad_len: index) -> tensor<?xf32> {
  %padded = call @padding1d(%input, %pad_len) : (tensor<?xf32>, index) -> tensor<?xf32>
  %result = call @elementwise_mul(%padded, %filter) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  return %result : tensor<?xf32>
}