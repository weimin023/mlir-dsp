#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
module {
  func.func @tosa_fft(%arg0: tensor<1x1x8xf32>, %arg1: tensor<1x1x8xf32>) -> (tensor<1x1x8xf32>, tensor<1x1x8xf32>) {
    %0 = tensor.empty() : tensor<1x1x8xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x1x8xf32>) -> tensor<1x1x8xf32>
    %2 = tensor.empty() : tensor<1x1x8xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<1x1x8xf32>) -> tensor<1x1x8xf32>
    %c1 = arith.constant 1 : index
    %c1_1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %cst_2 = arith.constant 6.28318548 : f32
    %4 = arith.index_castui %c1_1 : index to i32
    %5 = arith.uitofp %4 : i32 to f32
    %6 = arith.index_castui %c8 : index to i32
    %7 = arith.uitofp %6 : i32 to f32
    %8:2 = linalg.generic {indexing_maps = [#map, #map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<1x1x8xf32>, tensor<1x1x8xf32>) outs(%1, %3 : tensor<1x1x8xf32>, tensor<1x1x8xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32, %out_4: f32):
      %9 = linalg.index 1 : index
      %10 = linalg.index 2 : index
      %11 = linalg.index 3 : index
      %12 = linalg.index 4 : index
      %13 = index.mul %11, %9
      %14 = index.mul %12, %10
      %15 = index.remu %13, %c1_1
      %16 = index.remu %14, %c8
      %17 = arith.index_castui %15 : index to i32
      %18 = arith.uitofp %17 : i32 to f32
      %19 = arith.index_castui %16 : index to i32
      %20 = arith.uitofp %19 : i32 to f32
      %21 = arith.divf %18, %5 : f32
      %22 = arith.divf %20, %7 : f32
      %23 = arith.addf %21, %22 : f32
      %24 = arith.mulf %cst_2, %23 : f32
      %25 = math.cos %24 : f32
      %26 = math.sin %24 : f32
      %27 = arith.mulf %in, %25 : f32
      %28 = arith.mulf %in_3, %26 : f32
      %29 = arith.addf %27, %28 : f32
      %30 = arith.mulf %in_3, %25 : f32
      %31 = arith.mulf %in, %26 : f32
      %32 = arith.subf %30, %31 : f32
      %33 = arith.addf %out, %29 : f32
      %34 = arith.addf %out_4, %32 : f32
      linalg.yield %33, %34 : f32, f32
    } -> (tensor<1x1x8xf32>, tensor<1x1x8xf32>)
    return %8#0, %8#1 : tensor<1x1x8xf32>, tensor<1x1x8xf32>
  }
}

