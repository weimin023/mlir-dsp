func.func @tosa_fft(%arg0: tensor<1x1x8xf32>, %arg1: tensor<1x1x8xf32>) -> (tensor<1x1x8xf32>, tensor<1x1x8xf32>) {
  %0, %1 = tosa.fft2d %arg0, %arg1 {inverse = false} : (tensor<1x1x8xf32>, tensor<1x1x8xf32>) -> (tensor<1x1x8xf32>, tensor<1x1x8xf32>)
  return %0, %1 : tensor<1x1x8xf32>, tensor<1x1x8xf32>
}
