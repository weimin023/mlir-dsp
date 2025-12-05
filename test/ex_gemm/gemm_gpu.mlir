module attributes {gpu.container_module} {
  func.func @naive_gemm(%arg0: memref<?x?xf16>, %arg1: memref<?x?xf16>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf16>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?xf16>
    %dim_1 = memref.dim %arg0, %c1 : memref<?x?xf16>
    %c0_2 = arith.constant 0 : index
    %0 = arith.subi %dim, %c0_2 : index
    %c16 = arith.constant 16 : index
    %1 = arith.ceildivsi %0, %c16 : index
    %c0_3 = arith.constant 0 : index
    %2 = arith.subi %dim_0, %c0_3 : index
    %c16_4 = arith.constant 16 : index
    %3 = arith.ceildivsi %2, %c16_4 : index
    %c1_5 = arith.constant 1 : index
    gpu.launch_func  @naive_gemm_kernel::@naive_gemm_kernel blocks in (%1, %c1_5, %c1_5) threads in (%3, %c1_5, %c1_5)  args(%c16 : index, %c0_2 : index, %c16_4 : index, %c0_3 : index, %arg0 : memref<?x?xf16>, %arg1 : memref<?x?xf16>, %arg2 : memref<?x?xf32>, %dim_1 : index, %dim_0 : index, %dim : index)
    return
  }
  gpu.module @naive_gemm_kernel {
    llvm.func @naive_gemm_kernel(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: !llvm.ptr, %arg5: !llvm.ptr, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: !llvm.ptr, %arg12: !llvm.ptr, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: i64, %arg21: i64, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: i64) attributes {gpu.kernel, nvvm.kernel} {
      %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
      %1 = llvm.insertvalue %arg18, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %2 = llvm.insertvalue %arg19, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %3 = llvm.insertvalue %arg20, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %4 = llvm.insertvalue %arg21, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %5 = llvm.insertvalue %arg23, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %6 = llvm.insertvalue %arg22, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %7 = llvm.insertvalue %arg24, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %8 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
      %9 = llvm.insertvalue %arg11, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %10 = llvm.insertvalue %arg12, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %11 = llvm.insertvalue %arg13, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %12 = llvm.insertvalue %arg14, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %13 = llvm.insertvalue %arg16, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %14 = llvm.insertvalue %arg15, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %15 = llvm.insertvalue %arg17, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %16 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
      %17 = llvm.insertvalue %arg4, %16[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %18 = llvm.insertvalue %arg5, %17[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %19 = llvm.insertvalue %arg6, %18[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %20 = llvm.insertvalue %arg7, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %21 = llvm.insertvalue %arg9, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %22 = llvm.insertvalue %arg8, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %23 = llvm.insertvalue %arg10, %22[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %24 = llvm.mlir.constant(1 : index) : i64
      %25 = llvm.mlir.constant(16 : index) : i64
      %26 = llvm.mlir.constant(0 : index) : i64
      %27 = nvvm.read.ptx.sreg.ctaid.x : i32
      %28 = llvm.sext %27 : i32 to i64
      %29 = nvvm.read.ptx.sreg.tid.x : i32
      %30 = llvm.sext %29 : i32 to i64
      %31 = llvm.mul %arg0, %28 : i64
      %32 = llvm.add %arg1, %31 : i64
      %33 = llvm.mul %arg2, %30 : i64
      %34 = llvm.add %arg3, %33 : i64
      llvm.br ^bb1(%26 : i64)
    ^bb1(%35: i64):  // 2 preds: ^bb0, ^bb11
      %36 = llvm.icmp "slt" %35, %arg25 : i64
      llvm.cond_br %36, ^bb2, ^bb12
    ^bb2:  // pred: ^bb1
      %37 = llvm.add %32, %25 : i64
      %38 = llvm.intr.smin(%37, %arg27) : (i64, i64) -> i64
      llvm.br ^bb3(%32 : i64)
    ^bb3(%39: i64):  // 2 preds: ^bb2, ^bb10
      %40 = llvm.icmp "slt" %39, %38 : i64
      llvm.cond_br %40, ^bb4, ^bb11
    ^bb4:  // pred: ^bb3
      %41 = llvm.add %34, %25 : i64
      %42 = llvm.intr.smin(%41, %arg26) : (i64, i64) -> i64
      llvm.br ^bb5(%34 : i64)
    ^bb5(%43: i64):  // 2 preds: ^bb4, ^bb9
      %44 = llvm.icmp "slt" %43, %42 : i64
      llvm.cond_br %44, ^bb6, ^bb10
    ^bb6:  // pred: ^bb5
      %45 = llvm.add %35, %25 : i64
      %46 = llvm.intr.smin(%45, %arg25) : (i64, i64) -> i64
      llvm.br ^bb7(%35 : i64)
    ^bb7(%47: i64):  // 2 preds: ^bb6, ^bb8
      %48 = llvm.icmp "slt" %47, %46 : i64
      llvm.cond_br %48, ^bb8, ^bb9
    ^bb8:  // pred: ^bb7
      %49 = llvm.extractvalue %23[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %50 = llvm.extractvalue %23[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %51 = llvm.mul %39, %50 overflow<nsw, nuw> : i64
      %52 = llvm.add %51, %47 overflow<nsw, nuw> : i64
      %53 = llvm.getelementptr inbounds|nuw %49[%52] : (!llvm.ptr, i64) -> !llvm.ptr, f16
      %54 = llvm.load %53 : !llvm.ptr -> f16
      %55 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %56 = llvm.extractvalue %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %57 = llvm.mul %47, %56 overflow<nsw, nuw> : i64
      %58 = llvm.add %57, %43 overflow<nsw, nuw> : i64
      %59 = llvm.getelementptr inbounds|nuw %55[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f16
      %60 = llvm.load %59 : !llvm.ptr -> f16
      %61 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %62 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %63 = llvm.mul %39, %62 overflow<nsw, nuw> : i64
      %64 = llvm.add %63, %43 overflow<nsw, nuw> : i64
      %65 = llvm.getelementptr inbounds|nuw %61[%64] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %66 = llvm.load %65 : !llvm.ptr -> f32
      %67 = llvm.fpext %54 : f16 to f32
      %68 = llvm.fpext %60 : f16 to f32
      %69 = llvm.fmul %67, %68 : f32
      %70 = llvm.fadd %66, %69 : f32
      %71 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %72 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
      %73 = llvm.mul %39, %72 overflow<nsw, nuw> : i64
      %74 = llvm.add %73, %43 overflow<nsw, nuw> : i64
      %75 = llvm.getelementptr inbounds|nuw %71[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %70, %75 : f32, !llvm.ptr
      %76 = llvm.add %47, %24 : i64
      llvm.br ^bb7(%76 : i64)
    ^bb9:  // pred: ^bb7
      %77 = llvm.add %43, %24 : i64
      llvm.br ^bb5(%77 : i64)
    ^bb10:  // pred: ^bb5
      %78 = llvm.add %39, %24 : i64
      llvm.br ^bb3(%78 : i64)
    ^bb11:  // pred: ^bb3
      %79 = llvm.add %35, %25 : i64
      llvm.br ^bb1(%79 : i64)
    ^bb12:  // pred: ^bb1
      llvm.return
    }
  }
}

