module {
  func.func @sin_gpu(%arg0: f32) -> f32 {
    %0 = llvm.intr.sin(%arg0) : (f32) -> f32
    return %0 : f32
  }
}

