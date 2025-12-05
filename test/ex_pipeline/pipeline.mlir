func.func @pipeline(%input: tensor<5x5xf32>, %kernel: tensor<3x3xf32>) -> tensor<9x9xf32> {
  %c0 = arith.constant 0.0 : f32
  
  // 1. Padding (5x5 -> 9x9)
  %t1_padding = tensor.pad %input low[2, 2] high[2, 2] {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %c0 : f32
  } : tensor<5x5xf32> to tensor<9x9xf32>

  // 2. Convolution (9x9 * 3x3 -> 7x7)
  %empty_conv = tensor.empty() : tensor<7x7xf32>
  %zero_conv = linalg.fill ins(%c0 : f32) outs(%empty_conv : tensor<7x7xf32>) -> tensor<7x7xf32>
  
  %t2 = linalg.conv_2d 
    ins(%t1_padding, %kernel : tensor<9x9xf32>, tensor<3x3xf32>)
    outs(%zero_conv : tensor<7x7xf32>) -> tensor<7x7xf32>

  // 3. Reuse t1_padding for output
  // We want to insert %t2 (7x7) into the center of %t1_padding (9x9)
  // But first we need to zero out %t1_padding because it contains old data
  // (Actually, we just need to zero the borders, but filling whole tensor is safer/easier)
  // However, to reuse the buffer, we should use 'outs(%t1_padding)' in a fill/copy op.
  
  // Clear t1_padding (reuse buffer)
  %t1_cleared = linalg.fill ins(%c0 : f32) outs(%t1_padding : tensor<9x9xf32>) -> tensor<9x9xf32>
  
  // Insert convolution result into center
  %output = tensor.insert_slice %t2 into %t1_cleared[1, 1] [7, 7] [1, 1] : tensor<7x7xf32> into tensor<9x9xf32>

  return %output : tensor<9x9xf32>
}
