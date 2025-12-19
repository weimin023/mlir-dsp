module {
  llvm.func @sin_gpu(%arg0: f32) -> f32 {
    %0 = math.sin %arg0 : f32
    llvm.return %0 : f32
  }
}

