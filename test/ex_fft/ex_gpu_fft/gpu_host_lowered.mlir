module attributes {gpu.container_module} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @tosa_fft(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64) -> !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)> attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %1 = llvm.insertvalue %arg9, %0[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.insertvalue %arg10, %1[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.insertvalue %arg11, %2[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %4 = llvm.insertvalue %arg12, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.insertvalue %arg15, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %6 = llvm.insertvalue %arg13, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.insertvalue %arg16, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %8 = llvm.insertvalue %arg14, %7[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.insertvalue %arg17, %8[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %10 = builtin.unrealized_conversion_cast %9 : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> to memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
    %11 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %12 = llvm.insertvalue %arg0, %11[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %13 = llvm.insertvalue %arg1, %12[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %14 = llvm.insertvalue %arg2, %13[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %15 = llvm.insertvalue %arg3, %14[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %16 = llvm.insertvalue %arg6, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.insertvalue %arg4, %16[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %18 = llvm.insertvalue %arg7, %17[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %19 = llvm.insertvalue %arg5, %18[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %20 = llvm.insertvalue %arg8, %19[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %21 = builtin.unrealized_conversion_cast %20 : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> to memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = builtin.unrealized_conversion_cast %22 : i64 to index
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = builtin.unrealized_conversion_cast %24 : i64 to index
    %26 = llvm.mlir.constant(8.000000e+00 : f32) : f32
    %27 = llvm.mlir.constant(6.28318548 : f32) : f32
    %28 = llvm.mlir.constant(8 : index) : i64
    %29 = builtin.unrealized_conversion_cast %28 : i64 to index
    %30 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %31 = llvm.mlir.constant(1 : index) : i64
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.mlir.constant(8 : index) : i64
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.mlir.constant(8 : index) : i64
    %36 = llvm.mlir.constant(8 : index) : i64
    %37 = llvm.mlir.zero : !llvm.ptr
    %38 = llvm.getelementptr %37[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %39 = llvm.ptrtoint %38 : !llvm.ptr to i64
    %40 = llvm.mlir.constant(64 : index) : i64
    %41 = llvm.add %39, %40 : i64
    %42 = llvm.call @malloc(%41) : (i64) -> !llvm.ptr
    %43 = llvm.ptrtoint %42 : !llvm.ptr to i64
    %44 = llvm.mlir.constant(1 : index) : i64
    %45 = llvm.sub %40, %44 : i64
    %46 = llvm.add %43, %45 : i64
    %47 = llvm.urem %46, %40 : i64
    %48 = llvm.sub %46, %47 : i64
    %49 = llvm.inttoptr %48 : i64 to !llvm.ptr
    %50 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %51 = llvm.insertvalue %42, %50[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %52 = llvm.insertvalue %49, %51[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %53 = llvm.mlir.constant(0 : index) : i64
    %54 = llvm.insertvalue %53, %52[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %55 = llvm.insertvalue %31, %54[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %56 = llvm.insertvalue %32, %55[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %57 = llvm.insertvalue %33, %56[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %58 = llvm.insertvalue %35, %57[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %59 = llvm.insertvalue %33, %58[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %60 = llvm.insertvalue %34, %59[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %61 = builtin.unrealized_conversion_cast %60 : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> to memref<1x1x8xf32>
    gpu.launch_func  @tosa_fft_kernel::@tosa_fft_kernel blocks in (%23, %23, %23) threads in (%23, %23, %23)  args(%25 : index, %25 : index, %30 : f32, %61 : memref<1x1x8xf32>)
    %62 = llvm.mlir.constant(1 : index) : i64
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.mlir.constant(8 : index) : i64
    %65 = llvm.mlir.constant(1 : index) : i64
    %66 = llvm.mlir.constant(8 : index) : i64
    %67 = llvm.mlir.constant(8 : index) : i64
    %68 = llvm.mlir.zero : !llvm.ptr
    %69 = llvm.getelementptr %68[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = llvm.ptrtoint %69 : !llvm.ptr to i64
    %71 = llvm.mlir.constant(64 : index) : i64
    %72 = llvm.add %70, %71 : i64
    %73 = llvm.call @malloc(%72) : (i64) -> !llvm.ptr
    %74 = llvm.ptrtoint %73 : !llvm.ptr to i64
    %75 = llvm.mlir.constant(1 : index) : i64
    %76 = llvm.sub %71, %75 : i64
    %77 = llvm.add %74, %76 : i64
    %78 = llvm.urem %77, %71 : i64
    %79 = llvm.sub %77, %78 : i64
    %80 = llvm.inttoptr %79 : i64 to !llvm.ptr
    %81 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %82 = llvm.insertvalue %73, %81[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %83 = llvm.insertvalue %80, %82[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %84 = llvm.mlir.constant(0 : index) : i64
    %85 = llvm.insertvalue %84, %83[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %86 = llvm.insertvalue %62, %85[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %87 = llvm.insertvalue %63, %86[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %88 = llvm.insertvalue %64, %87[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %89 = llvm.insertvalue %66, %88[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %90 = llvm.insertvalue %64, %89[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %91 = llvm.insertvalue %65, %90[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %92 = builtin.unrealized_conversion_cast %91 : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> to memref<1x1x8xf32>
    gpu.launch_func  @tosa_fft_kernel_0::@tosa_fft_kernel blocks in (%23, %23, %23) threads in (%23, %23, %23)  args(%25 : index, %25 : index, %30 : f32, %92 : memref<1x1x8xf32>)
    gpu.launch_func  @tosa_fft_kernel_1::@tosa_fft_kernel blocks in (%23, %23, %23) threads in (%23, %23, %23)  args(%25 : index, %25 : index, %21 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %10 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %61 : memref<1x1x8xf32>, %92 : memref<1x1x8xf32>, %29 : index, %26 : f32, %30 : f32, %27 : f32)
    %93 = llvm.mlir.poison : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)>
    %94 = llvm.insertvalue %60, %93[0] : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)> 
    %95 = llvm.insertvalue %91, %94[1] : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)> 
    llvm.return %95 : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)>
  }
  llvm.func @_mlir_ciface_tosa_fft(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {llvm.emit_c_interface} {
    %0 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %4 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.extractvalue %0[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %6 = llvm.extractvalue %0[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %8 = llvm.extractvalue %0[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.extractvalue %0[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %10 = llvm.load %arg2 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %11 = llvm.extractvalue %10[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %12 = llvm.extractvalue %10[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %13 = llvm.extractvalue %10[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %14 = llvm.extractvalue %10[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %15 = llvm.extractvalue %10[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %16 = llvm.extractvalue %10[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.extractvalue %10[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %18 = llvm.extractvalue %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %19 = llvm.extractvalue %10[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %20 = llvm.call @tosa_fft(%1, %2, %3, %4, %5, %6, %7, %8, %9, %11, %12, %13, %14, %15, %16, %17, %18, %19) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, i64, i64) -> !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)>
    llvm.store %20, %arg0 : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)>, !llvm.ptr
    llvm.return
  }
  gpu.module @tosa_fft_kernel [#nvvm.target<O = 3, chip = "sm_89">] {
    llvm.func @tosa_fft_kernel(%arg0: i64, %arg1: i64, %arg2: f32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64) attributes {gpu.kernel, nvvm.kernel} {
      %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
      %1 = llvm.insertvalue %arg3, %0[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %2 = llvm.insertvalue %arg4, %1[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %3 = llvm.insertvalue %arg5, %2[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %4 = llvm.insertvalue %arg6, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %5 = llvm.insertvalue %arg9, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %6 = llvm.insertvalue %arg7, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %7 = llvm.insertvalue %arg10, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %8 = llvm.insertvalue %arg8, %7[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %9 = llvm.insertvalue %arg11, %8[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %10 = llvm.mlir.constant(1 : index) : i64
      %11 = llvm.mlir.constant(8 : index) : i64
      %12 = llvm.mlir.constant(0 : index) : i64
      %13 = nvvm.read.ptx.sreg.ctaid.x : i32
      %14 = llvm.sext %13 : i32 to i64
      %15 = nvvm.read.ptx.sreg.tid.x : i32
      %16 = llvm.sext %15 : i32 to i64
      %17 = llvm.add %arg0, %14 : i64
      %18 = llvm.add %arg1, %16 : i64
      llvm.br ^bb1(%12 : i64)
    ^bb1(%19: i64):  // 2 preds: ^bb0, ^bb11
      %20 = llvm.icmp "slt" %19, %11 : i64
      llvm.cond_br %20, ^bb2, ^bb12
    ^bb2:  // pred: ^bb1
      %21 = llvm.add %17, %10 : i64
      llvm.br ^bb3(%17 : i64)
    ^bb3(%22: i64):  // 2 preds: ^bb2, ^bb10
      %23 = llvm.icmp "slt" %22, %21 : i64
      llvm.cond_br %23, ^bb4, ^bb11
    ^bb4:  // pred: ^bb3
      %24 = llvm.add %18, %10 : i64
      llvm.br ^bb5(%18 : i64)
    ^bb5(%25: i64):  // 2 preds: ^bb4, ^bb9
      %26 = llvm.icmp "slt" %25, %24 : i64
      llvm.cond_br %26, ^bb6, ^bb10
    ^bb6:  // pred: ^bb5
      %27 = llvm.add %19, %10 : i64
      llvm.br ^bb7(%19 : i64)
    ^bb7(%28: i64):  // 2 preds: ^bb6, ^bb8
      %29 = llvm.icmp "slt" %28, %27 : i64
      llvm.cond_br %29, ^bb8, ^bb9
    ^bb8:  // pred: ^bb7
      %30 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %31 = llvm.mlir.constant(8 : index) : i64
      %32 = llvm.mul %22, %31 overflow<nsw, nuw> : i64
      %33 = llvm.mlir.constant(8 : index) : i64
      %34 = llvm.mul %25, %33 overflow<nsw, nuw> : i64
      %35 = llvm.add %32, %34 overflow<nsw, nuw> : i64
      %36 = llvm.add %35, %28 overflow<nsw, nuw> : i64
      %37 = llvm.getelementptr inbounds|nuw %30[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %arg2, %37 : f32, !llvm.ptr
      %38 = llvm.add %28, %10 : i64
      llvm.br ^bb7(%38 : i64)
    ^bb9:  // pred: ^bb7
      %39 = llvm.add %25, %10 : i64
      llvm.br ^bb5(%39 : i64)
    ^bb10:  // pred: ^bb5
      %40 = llvm.add %22, %10 : i64
      llvm.br ^bb3(%40 : i64)
    ^bb11:  // pred: ^bb3
      %41 = llvm.add %19, %10 : i64
      llvm.br ^bb1(%41 : i64)
    ^bb12:  // pred: ^bb1
      llvm.return
    }
  }
  gpu.module @tosa_fft_kernel_0 [#nvvm.target<O = 3, chip = "sm_89">] {
    llvm.func @tosa_fft_kernel(%arg0: i64, %arg1: i64, %arg2: f32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64) attributes {gpu.kernel, nvvm.kernel} {
      %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
      %1 = llvm.insertvalue %arg3, %0[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %2 = llvm.insertvalue %arg4, %1[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %3 = llvm.insertvalue %arg5, %2[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %4 = llvm.insertvalue %arg6, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %5 = llvm.insertvalue %arg9, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %6 = llvm.insertvalue %arg7, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %7 = llvm.insertvalue %arg10, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %8 = llvm.insertvalue %arg8, %7[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %9 = llvm.insertvalue %arg11, %8[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %10 = llvm.mlir.constant(1 : index) : i64
      %11 = llvm.mlir.constant(8 : index) : i64
      %12 = llvm.mlir.constant(0 : index) : i64
      %13 = nvvm.read.ptx.sreg.ctaid.x : i32
      %14 = llvm.sext %13 : i32 to i64
      %15 = nvvm.read.ptx.sreg.tid.x : i32
      %16 = llvm.sext %15 : i32 to i64
      %17 = llvm.add %arg0, %14 : i64
      %18 = llvm.add %arg1, %16 : i64
      llvm.br ^bb1(%12 : i64)
    ^bb1(%19: i64):  // 2 preds: ^bb0, ^bb11
      %20 = llvm.icmp "slt" %19, %11 : i64
      llvm.cond_br %20, ^bb2, ^bb12
    ^bb2:  // pred: ^bb1
      %21 = llvm.add %17, %10 : i64
      llvm.br ^bb3(%17 : i64)
    ^bb3(%22: i64):  // 2 preds: ^bb2, ^bb10
      %23 = llvm.icmp "slt" %22, %21 : i64
      llvm.cond_br %23, ^bb4, ^bb11
    ^bb4:  // pred: ^bb3
      %24 = llvm.add %18, %10 : i64
      llvm.br ^bb5(%18 : i64)
    ^bb5(%25: i64):  // 2 preds: ^bb4, ^bb9
      %26 = llvm.icmp "slt" %25, %24 : i64
      llvm.cond_br %26, ^bb6, ^bb10
    ^bb6:  // pred: ^bb5
      %27 = llvm.add %19, %10 : i64
      llvm.br ^bb7(%19 : i64)
    ^bb7(%28: i64):  // 2 preds: ^bb6, ^bb8
      %29 = llvm.icmp "slt" %28, %27 : i64
      llvm.cond_br %29, ^bb8, ^bb9
    ^bb8:  // pred: ^bb7
      %30 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %31 = llvm.mlir.constant(8 : index) : i64
      %32 = llvm.mul %22, %31 overflow<nsw, nuw> : i64
      %33 = llvm.mlir.constant(8 : index) : i64
      %34 = llvm.mul %25, %33 overflow<nsw, nuw> : i64
      %35 = llvm.add %32, %34 overflow<nsw, nuw> : i64
      %36 = llvm.add %35, %28 overflow<nsw, nuw> : i64
      %37 = llvm.getelementptr inbounds|nuw %30[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %arg2, %37 : f32, !llvm.ptr
      %38 = llvm.add %28, %10 : i64
      llvm.br ^bb7(%38 : i64)
    ^bb9:  // pred: ^bb7
      %39 = llvm.add %25, %10 : i64
      llvm.br ^bb5(%39 : i64)
    ^bb10:  // pred: ^bb5
      %40 = llvm.add %22, %10 : i64
      llvm.br ^bb3(%40 : i64)
    ^bb11:  // pred: ^bb3
      %41 = llvm.add %19, %10 : i64
      llvm.br ^bb1(%41 : i64)
    ^bb12:  // pred: ^bb1
      llvm.return
    }
  }
  gpu.module @tosa_fft_kernel_1 [#nvvm.target<O = 3, chip = "sm_89">] {
    llvm.func @__nv_floorf(f32) -> f32
    llvm.func @__nv_fmaf(f32, f32, f32) -> f32
    llvm.func @tosa_fft_kernel(%arg0: i64, %arg1: i64, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: !llvm.ptr, %arg12: !llvm.ptr, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: i64, %arg29: !llvm.ptr, %arg30: !llvm.ptr, %arg31: i64, %arg32: i64, %arg33: i64, %arg34: i64, %arg35: i64, %arg36: i64, %arg37: i64, %arg38: i64, %arg39: f32, %arg40: f32, %arg41: f32) attributes {gpu.kernel, nvvm.kernel} {
      %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
      %1 = llvm.insertvalue %arg29, %0[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %2 = llvm.insertvalue %arg30, %1[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %3 = llvm.insertvalue %arg31, %2[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %4 = llvm.insertvalue %arg32, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %5 = llvm.insertvalue %arg35, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %6 = llvm.insertvalue %arg33, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %7 = llvm.insertvalue %arg36, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %8 = llvm.insertvalue %arg34, %7[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %9 = llvm.insertvalue %arg37, %8[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %10 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
      %11 = llvm.insertvalue %arg20, %10[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %12 = llvm.insertvalue %arg21, %11[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %13 = llvm.insertvalue %arg22, %12[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %14 = llvm.insertvalue %arg23, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %15 = llvm.insertvalue %arg26, %14[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %16 = llvm.insertvalue %arg24, %15[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %17 = llvm.insertvalue %arg27, %16[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %18 = llvm.insertvalue %arg25, %17[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %19 = llvm.insertvalue %arg28, %18[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %20 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
      %21 = llvm.insertvalue %arg11, %20[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %22 = llvm.insertvalue %arg12, %21[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %23 = llvm.insertvalue %arg13, %22[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %24 = llvm.insertvalue %arg14, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %25 = llvm.insertvalue %arg17, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %26 = llvm.insertvalue %arg15, %25[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %27 = llvm.insertvalue %arg18, %26[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %28 = llvm.insertvalue %arg16, %27[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %29 = llvm.insertvalue %arg19, %28[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %30 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
      %31 = llvm.insertvalue %arg2, %30[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %32 = llvm.insertvalue %arg3, %31[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %33 = llvm.insertvalue %arg4, %32[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %34 = llvm.insertvalue %arg5, %33[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %35 = llvm.insertvalue %arg8, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %36 = llvm.insertvalue %arg6, %35[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %37 = llvm.insertvalue %arg9, %36[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %38 = llvm.insertvalue %arg7, %37[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %39 = llvm.insertvalue %arg10, %38[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %40 = llvm.mlir.constant(2 : i32) : i32
      %41 = llvm.mlir.constant(1 : i32) : i32
      %42 = llvm.mlir.constant(0 : i32) : i32
      %43 = llvm.mlir.constant(3 : i32) : i32
      %44 = llvm.mlir.constant(-2.59630184E-7 : f32) : f32
      %45 = llvm.mlir.constant(2.47562348E-5 : f32) : f32
      %46 = llvm.mlir.constant(-0.00138883304 : f32) : f32
      %47 = llvm.mlir.constant(0.0416666418 : f32) : f32
      %48 = llvm.mlir.constant(-5.000000e-01 : f32) : f32
      %49 = llvm.mlir.constant(-2.50293279E-8 : f32) : f32
      %50 = llvm.mlir.constant(2.76001265E-6 : f32) : f32
      %51 = llvm.mlir.constant(-1.98426045E-4 : f32) : f32
      %52 = llvm.mlir.constant(0.00833334774 : f32) : f32
      %53 = llvm.mlir.constant(-0.166666672 : f32) : f32
      %54 = llvm.mlir.constant(-1.000000e+00 : f32) : f32
      %55 = llvm.mlir.constant(1.000000e+00 : f32) : f32
      %56 = llvm.mlir.constant(1.57079637 : f32) : f32
      %57 = llvm.mlir.constant(0.636619746 : f32) : f32
      %58 = llvm.mlir.constant(1 : index) : i64
      %59 = llvm.mlir.constant(8 : index) : i64
      %60 = llvm.mlir.constant(0 : index) : i64
      %61 = nvvm.read.ptx.sreg.ctaid.x : i32
      %62 = llvm.sext %61 : i32 to i64
      %63 = nvvm.read.ptx.sreg.tid.x : i32
      %64 = llvm.sext %63 : i32 to i64
      %65 = llvm.add %arg0, %62 : i64
      %66 = llvm.add %arg1, %64 : i64
      llvm.br ^bb1(%60 : i64)
    ^bb1(%67: i64):  // 2 preds: ^bb0, ^bb23
      %68 = llvm.icmp "slt" %67, %59 : i64
      llvm.cond_br %68, ^bb2, ^bb24
    ^bb2:  // pred: ^bb1
      llvm.br ^bb3(%60 : i64)
    ^bb3(%69: i64):  // 2 preds: ^bb2, ^bb22
      %70 = llvm.icmp "slt" %69, %58 : i64
      llvm.cond_br %70, ^bb4, ^bb23
    ^bb4:  // pred: ^bb3
      llvm.br ^bb5(%60 : i64)
    ^bb5(%71: i64):  // 2 preds: ^bb4, ^bb21
      %72 = llvm.icmp "slt" %71, %59 : i64
      llvm.cond_br %72, ^bb6, ^bb22
    ^bb6:  // pred: ^bb5
      %73 = llvm.add %65, %58 : i64
      llvm.br ^bb7(%65 : i64)
    ^bb7(%74: i64):  // 2 preds: ^bb6, ^bb20
      %75 = llvm.icmp "slt" %74, %73 : i64
      llvm.cond_br %75, ^bb8, ^bb21
    ^bb8:  // pred: ^bb7
      %76 = llvm.add %66, %58 : i64
      llvm.br ^bb9(%66 : i64)
    ^bb9(%77: i64):  // 2 preds: ^bb8, ^bb19
      %78 = llvm.icmp "slt" %77, %76 : i64
      llvm.cond_br %78, ^bb10, ^bb20
    ^bb10:  // pred: ^bb9
      %79 = llvm.add %67, %58 : i64
      llvm.br ^bb11(%67 : i64)
    ^bb11(%80: i64):  // 2 preds: ^bb10, ^bb18
      %81 = llvm.icmp "slt" %80, %79 : i64
      llvm.cond_br %81, ^bb12, ^bb19
    ^bb12:  // pred: ^bb11
      %82 = llvm.add %69, %58 : i64
      llvm.br ^bb13(%69 : i64)
    ^bb13(%83: i64):  // 2 preds: ^bb12, ^bb17
      %84 = llvm.icmp "slt" %83, %82 : i64
      llvm.cond_br %84, ^bb14, ^bb18
    ^bb14:  // pred: ^bb13
      %85 = llvm.add %71, %58 : i64
      llvm.br ^bb15(%71 : i64)
    ^bb15(%86: i64):  // 2 preds: ^bb14, ^bb16
      %87 = llvm.icmp "slt" %86, %85 : i64
      llvm.cond_br %87, ^bb16, ^bb17
    ^bb16:  // pred: ^bb15
      %88 = llvm.extractvalue %39[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %89 = llvm.extractvalue %39[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %90 = llvm.getelementptr %88[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %91 = llvm.extractvalue %39[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %92 = llvm.mul %74, %91 overflow<nsw, nuw> : i64
      %93 = llvm.extractvalue %39[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %94 = llvm.mul %83, %93 overflow<nsw, nuw> : i64
      %95 = llvm.add %92, %94 overflow<nsw, nuw> : i64
      %96 = llvm.extractvalue %39[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %97 = llvm.mul %86, %96 overflow<nsw, nuw> : i64
      %98 = llvm.add %95, %97 overflow<nsw, nuw> : i64
      %99 = llvm.getelementptr inbounds|nuw %90[%98] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %100 = llvm.load %99 : !llvm.ptr -> f32
      %101 = llvm.extractvalue %29[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %102 = llvm.extractvalue %29[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %103 = llvm.getelementptr %101[%102] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %104 = llvm.extractvalue %29[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %105 = llvm.mul %74, %104 overflow<nsw, nuw> : i64
      %106 = llvm.extractvalue %29[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %107 = llvm.mul %83, %106 overflow<nsw, nuw> : i64
      %108 = llvm.add %105, %107 overflow<nsw, nuw> : i64
      %109 = llvm.extractvalue %29[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %110 = llvm.mul %86, %109 overflow<nsw, nuw> : i64
      %111 = llvm.add %108, %110 overflow<nsw, nuw> : i64
      %112 = llvm.getelementptr inbounds|nuw %103[%111] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %113 = llvm.load %112 : !llvm.ptr -> f32
      %114 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %115 = llvm.mlir.constant(8 : index) : i64
      %116 = llvm.mul %74, %115 overflow<nsw, nuw> : i64
      %117 = llvm.mlir.constant(8 : index) : i64
      %118 = llvm.mul %77, %117 overflow<nsw, nuw> : i64
      %119 = llvm.add %116, %118 overflow<nsw, nuw> : i64
      %120 = llvm.add %119, %80 overflow<nsw, nuw> : i64
      %121 = llvm.getelementptr inbounds|nuw %114[%120] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %122 = llvm.load %121 : !llvm.ptr -> f32
      %123 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %124 = llvm.mlir.constant(8 : index) : i64
      %125 = llvm.mul %74, %124 overflow<nsw, nuw> : i64
      %126 = llvm.mlir.constant(8 : index) : i64
      %127 = llvm.mul %77, %126 overflow<nsw, nuw> : i64
      %128 = llvm.add %125, %127 overflow<nsw, nuw> : i64
      %129 = llvm.add %128, %80 overflow<nsw, nuw> : i64
      %130 = llvm.getelementptr inbounds|nuw %123[%129] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %131 = llvm.load %130 : !llvm.ptr -> f32
      %132 = llvm.mul %86, %80 : i64
      %133 = llvm.urem %132, %arg38 : i64
      %134 = llvm.trunc %133 : i64 to i32
      %135 = llvm.uitofp %134 : i32 to f32
      %136 = llvm.fdiv %135, %arg39 : f32
      %137 = llvm.fadd %136, %arg40 : f32
      %138 = llvm.fmul %137, %arg41 : f32
      %139 = llvm.fmul %138, %57 : f32
      %140 = llvm.call @__nv_floorf(%139) : (f32) -> f32
      %141 = llvm.fmul %140, %56 : f32
      %142 = llvm.fsub %138, %141 : f32
      %143 = llvm.fptosi %140 : f32 to i32
      %144 = llvm.and %143, %43 : i32
      %145 = llvm.icmp "eq" %144, %42 : i32
      %146 = llvm.icmp "eq" %144, %41 : i32
      %147 = llvm.icmp "eq" %144, %40 : i32
      %148 = llvm.or %145, %147 : i1
      %149 = llvm.or %146, %147 : i1
      %150 = llvm.fmul %142, %142 : f32
      %151 = llvm.select %148, %55, %142 : i1, f32
      %152 = llvm.select %148, %48, %53 : i1, f32
      %153 = llvm.select %148, %47, %52 : i1, f32
      %154 = llvm.select %148, %46, %51 : i1, f32
      %155 = llvm.select %148, %45, %50 : i1, f32
      %156 = llvm.select %148, %44, %49 : i1, f32
      %157 = llvm.call @__nv_fmaf(%150, %156, %155) : (f32, f32, f32) -> f32
      %158 = llvm.call @__nv_fmaf(%150, %157, %154) : (f32, f32, f32) -> f32
      %159 = llvm.call @__nv_fmaf(%150, %158, %153) : (f32, f32, f32) -> f32
      %160 = llvm.call @__nv_fmaf(%150, %159, %152) : (f32, f32, f32) -> f32
      %161 = llvm.call @__nv_fmaf(%150, %160, %55) : (f32, f32, f32) -> f32
      %162 = llvm.fmul %151, %161 : f32
      %163 = llvm.fmul %162, %54 : f32
      %164 = llvm.select %149, %163, %162 : i1, f32
      %165 = llvm.fmul %138, %57 : f32
      %166 = llvm.call @__nv_floorf(%165) : (f32) -> f32
      %167 = llvm.fmul %166, %56 : f32
      %168 = llvm.fsub %138, %167 : f32
      %169 = llvm.fptosi %166 : f32 to i32
      %170 = llvm.and %169, %43 : i32
      %171 = llvm.icmp "eq" %170, %41 : i32
      %172 = llvm.icmp "eq" %170, %43 : i32
      %173 = llvm.or %171, %172 : i1
      %174 = llvm.icmp "sgt" %170, %41 : i32
      %175 = llvm.fmul %168, %168 : f32
      %176 = llvm.select %173, %55, %168 : i1, f32
      %177 = llvm.select %173, %48, %53 : i1, f32
      %178 = llvm.select %173, %47, %52 : i1, f32
      %179 = llvm.select %173, %46, %51 : i1, f32
      %180 = llvm.select %173, %45, %50 : i1, f32
      %181 = llvm.select %173, %44, %49 : i1, f32
      %182 = llvm.call @__nv_fmaf(%175, %181, %180) : (f32, f32, f32) -> f32
      %183 = llvm.call @__nv_fmaf(%175, %182, %179) : (f32, f32, f32) -> f32
      %184 = llvm.call @__nv_fmaf(%175, %183, %178) : (f32, f32, f32) -> f32
      %185 = llvm.call @__nv_fmaf(%175, %184, %177) : (f32, f32, f32) -> f32
      %186 = llvm.call @__nv_fmaf(%175, %185, %55) : (f32, f32, f32) -> f32
      %187 = llvm.fmul %176, %186 : f32
      %188 = llvm.fmul %187, %54 : f32
      %189 = llvm.select %174, %188, %187 : i1, f32
      %190 = llvm.fmul %100, %164 : f32
      %191 = llvm.fmul %113, %189 : f32
      %192 = llvm.fadd %190, %191 : f32
      %193 = llvm.fmul %113, %164 : f32
      %194 = llvm.fmul %100, %189 : f32
      %195 = llvm.fsub %193, %194 : f32
      %196 = llvm.fadd %122, %192 : f32
      %197 = llvm.fadd %131, %195 : f32
      %198 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %199 = llvm.mlir.constant(8 : index) : i64
      %200 = llvm.mul %74, %199 overflow<nsw, nuw> : i64
      %201 = llvm.mlir.constant(8 : index) : i64
      %202 = llvm.mul %77, %201 overflow<nsw, nuw> : i64
      %203 = llvm.add %200, %202 overflow<nsw, nuw> : i64
      %204 = llvm.add %203, %80 overflow<nsw, nuw> : i64
      %205 = llvm.getelementptr inbounds|nuw %198[%204] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %196, %205 : f32, !llvm.ptr
      %206 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
      %207 = llvm.mlir.constant(8 : index) : i64
      %208 = llvm.mul %74, %207 overflow<nsw, nuw> : i64
      %209 = llvm.mlir.constant(8 : index) : i64
      %210 = llvm.mul %77, %209 overflow<nsw, nuw> : i64
      %211 = llvm.add %208, %210 overflow<nsw, nuw> : i64
      %212 = llvm.add %211, %80 overflow<nsw, nuw> : i64
      %213 = llvm.getelementptr inbounds|nuw %206[%212] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %197, %213 : f32, !llvm.ptr
      %214 = llvm.add %86, %58 : i64
      llvm.br ^bb15(%214 : i64)
    ^bb17:  // pred: ^bb15
      %215 = llvm.add %83, %58 : i64
      llvm.br ^bb13(%215 : i64)
    ^bb18:  // pred: ^bb13
      %216 = llvm.add %80, %58 : i64
      llvm.br ^bb11(%216 : i64)
    ^bb19:  // pred: ^bb11
      %217 = llvm.add %77, %58 : i64
      llvm.br ^bb9(%217 : i64)
    ^bb20:  // pred: ^bb9
      %218 = llvm.add %74, %58 : i64
      llvm.br ^bb7(%218 : i64)
    ^bb21:  // pred: ^bb7
      %219 = llvm.add %71, %58 : i64
      llvm.br ^bb5(%219 : i64)
    ^bb22:  // pred: ^bb5
      %220 = llvm.add %69, %58 : i64
      llvm.br ^bb3(%220 : i64)
    ^bb23:  // pred: ^bb3
      %221 = llvm.add %67, %58 : i64
      llvm.br ^bb1(%221 : i64)
    ^bb24:  // pred: ^bb1
      llvm.return
    }
  }
}

