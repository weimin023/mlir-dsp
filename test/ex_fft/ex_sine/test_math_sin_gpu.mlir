// Simple example: compute sin(x) on GPU
module {
  func.func @sin_gpu(%arg0: f32) -> f32 {
    %result = math.sin %arg0 : f32
    return %result : f32
  }
}
