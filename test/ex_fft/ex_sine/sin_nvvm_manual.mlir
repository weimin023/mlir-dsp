// Manual example showing NVVM intrinsic usage
module {
  gpu.module @sin_kernel {
    llvm.func @llvm.nvvm.sin.approx.f32(f32) -> f32
    
    llvm.func @sin_gpu(%arg0: f32) -> f32 attributes {gpu.kernel, nvvm.kernel} {
      %result = llvm.call @llvm.nvvm.sin.approx.f32(%arg0) : (f32) -> f32
      llvm.return %result : f32
    }
  }
}
