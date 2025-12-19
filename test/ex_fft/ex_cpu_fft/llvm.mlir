module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @tosa_fft(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64) -> !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)> attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.poison : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)>
    %1 = llvm.mlir.constant(64 : index) : i64
    %2 = llvm.mlir.zero : !llvm.ptr
    %3 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %4 = llvm.mlir.constant(8 : index) : i64
    %5 = llvm.mlir.constant(6.28318548 : f32) : f32
    %6 = llvm.mlir.constant(8.000000e+00 : f32) : f32
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>
    %10 = llvm.getelementptr %2[8] : (!llvm.ptr) -> !llvm.ptr, f32
    %11 = llvm.ptrtoint %10 : !llvm.ptr to i64
    %12 = llvm.add %11, %1 : i64
    %13 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr
    %14 = llvm.ptrtoint %13 : !llvm.ptr to i64
    %15 = llvm.sub %1, %8 : i64
    %16 = llvm.add %14, %15 : i64
    %17 = llvm.urem %16, %1 : i64
    %18 = llvm.sub %16, %17 : i64
    %19 = llvm.inttoptr %18 : i64 to !llvm.ptr
    %20 = llvm.insertvalue %13, %9[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %21 = llvm.insertvalue %19, %20[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %22 = llvm.insertvalue %7, %21[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %23 = llvm.insertvalue %8, %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %24 = llvm.insertvalue %8, %23[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %25 = llvm.insertvalue %4, %24[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %26 = llvm.insertvalue %4, %25[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %27 = llvm.insertvalue %4, %26[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %28 = llvm.insertvalue %8, %27[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.br ^bb1(%7 : i64)
  ^bb1(%29: i64):  // 2 preds: ^bb0, ^bb8
    %30 = llvm.icmp "slt" %29, %8 : i64
    llvm.cond_br %30, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%7 : i64)
  ^bb3(%31: i64):  // 2 preds: ^bb2, ^bb7
    %32 = llvm.icmp "slt" %31, %8 : i64
    llvm.cond_br %32, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%7 : i64)
  ^bb5(%33: i64):  // 2 preds: ^bb4, ^bb6
    %34 = llvm.icmp "slt" %33, %4 : i64
    llvm.cond_br %34, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %35 = llvm.mul %29, %4 overflow<nsw, nuw> : i64
    %36 = llvm.mul %31, %4 overflow<nsw, nuw> : i64
    %37 = llvm.add %35, %36 overflow<nsw, nuw> : i64
    %38 = llvm.add %37, %33 overflow<nsw, nuw> : i64
    %39 = llvm.getelementptr inbounds|nuw %19[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %3, %39 : f32, !llvm.ptr
    %40 = llvm.add %33, %8 : i64
    llvm.br ^bb5(%40 : i64)
  ^bb7:  // pred: ^bb5
    %41 = llvm.add %31, %8 : i64
    llvm.br ^bb3(%41 : i64)
  ^bb8:  // pred: ^bb3
    %42 = llvm.add %29, %8 : i64
    llvm.br ^bb1(%42 : i64)
  ^bb9:  // pred: ^bb1
    %43 = llvm.getelementptr %2[8] : (!llvm.ptr) -> !llvm.ptr, f32
    %44 = llvm.ptrtoint %43 : !llvm.ptr to i64
    %45 = llvm.add %44, %1 : i64
    %46 = llvm.call @malloc(%45) : (i64) -> !llvm.ptr
    %47 = llvm.ptrtoint %46 : !llvm.ptr to i64
    %48 = llvm.sub %1, %8 : i64
    %49 = llvm.add %47, %48 : i64
    %50 = llvm.urem %49, %1 : i64
    %51 = llvm.sub %49, %50 : i64
    %52 = llvm.inttoptr %51 : i64 to !llvm.ptr
    %53 = llvm.insertvalue %46, %9[0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %54 = llvm.insertvalue %52, %53[1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %55 = llvm.insertvalue %7, %54[2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %56 = llvm.insertvalue %8, %55[3, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %57 = llvm.insertvalue %8, %56[3, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %58 = llvm.insertvalue %4, %57[3, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %59 = llvm.insertvalue %4, %58[4, 0] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %60 = llvm.insertvalue %4, %59[4, 1] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    %61 = llvm.insertvalue %8, %60[4, 2] : !llvm.struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.br ^bb10(%7 : i64)
  ^bb10(%62: i64):  // 2 preds: ^bb9, ^bb17
    %63 = llvm.icmp "slt" %62, %8 : i64
    llvm.cond_br %63, ^bb11, ^bb18
  ^bb11:  // pred: ^bb10
    llvm.br ^bb12(%7 : i64)
  ^bb12(%64: i64):  // 2 preds: ^bb11, ^bb16
    %65 = llvm.icmp "slt" %64, %8 : i64
    llvm.cond_br %65, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    llvm.br ^bb14(%7 : i64)
  ^bb14(%66: i64):  // 2 preds: ^bb13, ^bb15
    %67 = llvm.icmp "slt" %66, %4 : i64
    llvm.cond_br %67, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %68 = llvm.mul %62, %4 overflow<nsw, nuw> : i64
    %69 = llvm.mul %64, %4 overflow<nsw, nuw> : i64
    %70 = llvm.add %68, %69 overflow<nsw, nuw> : i64
    %71 = llvm.add %70, %66 overflow<nsw, nuw> : i64
    %72 = llvm.getelementptr inbounds|nuw %52[%71] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %3, %72 : f32, !llvm.ptr
    %73 = llvm.add %66, %8 : i64
    llvm.br ^bb14(%73 : i64)
  ^bb16:  // pred: ^bb14
    %74 = llvm.add %64, %8 : i64
    llvm.br ^bb12(%74 : i64)
  ^bb17:  // pred: ^bb12
    %75 = llvm.add %62, %8 : i64
    llvm.br ^bb10(%75 : i64)
  ^bb18:  // pred: ^bb10
    llvm.br ^bb19(%7 : i64)
  ^bb19(%76: i64):  // 2 preds: ^bb18, ^bb32
    %77 = llvm.icmp "slt" %76, %8 : i64
    llvm.cond_br %77, ^bb20, ^bb33
  ^bb20:  // pred: ^bb19
    llvm.br ^bb21(%7 : i64)
  ^bb21(%78: i64):  // 2 preds: ^bb20, ^bb31
    %79 = llvm.icmp "slt" %78, %8 : i64
    llvm.cond_br %79, ^bb22, ^bb32
  ^bb22:  // pred: ^bb21
    llvm.br ^bb23(%7 : i64)
  ^bb23(%80: i64):  // 2 preds: ^bb22, ^bb30
    %81 = llvm.icmp "slt" %80, %4 : i64
    llvm.cond_br %81, ^bb24, ^bb31
  ^bb24:  // pred: ^bb23
    llvm.br ^bb25(%7 : i64)
  ^bb25(%82: i64):  // 2 preds: ^bb24, ^bb29
    %83 = llvm.icmp "slt" %82, %8 : i64
    llvm.cond_br %83, ^bb26, ^bb30
  ^bb26:  // pred: ^bb25
    llvm.br ^bb27(%7 : i64)
  ^bb27(%84: i64):  // 2 preds: ^bb26, ^bb28
    %85 = llvm.icmp "slt" %84, %4 : i64
    llvm.cond_br %85, ^bb28, ^bb29
  ^bb28:  // pred: ^bb27
    %86 = llvm.getelementptr %arg1[%arg2] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %87 = llvm.mul %76, %arg6 overflow<nsw, nuw> : i64
    %88 = llvm.mul %82, %arg7 overflow<nsw, nuw> : i64
    %89 = llvm.add %87, %88 overflow<nsw, nuw> : i64
    %90 = llvm.mul %84, %arg8 overflow<nsw, nuw> : i64
    %91 = llvm.add %89, %90 overflow<nsw, nuw> : i64
    %92 = llvm.getelementptr inbounds|nuw %86[%91] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %93 = llvm.load %92 : !llvm.ptr -> f32
    %94 = llvm.getelementptr %arg10[%arg11] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %95 = llvm.mul %76, %arg15 overflow<nsw, nuw> : i64
    %96 = llvm.mul %82, %arg16 overflow<nsw, nuw> : i64
    %97 = llvm.add %95, %96 overflow<nsw, nuw> : i64
    %98 = llvm.mul %84, %arg17 overflow<nsw, nuw> : i64
    %99 = llvm.add %97, %98 overflow<nsw, nuw> : i64
    %100 = llvm.getelementptr inbounds|nuw %94[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    %102 = llvm.mul %76, %4 overflow<nsw, nuw> : i64
    %103 = llvm.mul %78, %4 overflow<nsw, nuw> : i64
    %104 = llvm.add %102, %103 overflow<nsw, nuw> : i64
    %105 = llvm.add %104, %80 overflow<nsw, nuw> : i64
    %106 = llvm.getelementptr inbounds|nuw %19[%105] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %107 = llvm.load %106 : !llvm.ptr -> f32
    %108 = llvm.mul %76, %4 overflow<nsw, nuw> : i64
    %109 = llvm.mul %78, %4 overflow<nsw, nuw> : i64
    %110 = llvm.add %108, %109 overflow<nsw, nuw> : i64
    %111 = llvm.add %110, %80 overflow<nsw, nuw> : i64
    %112 = llvm.getelementptr inbounds|nuw %52[%111] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %113 = llvm.load %112 : !llvm.ptr -> f32
    %114 = llvm.mul %84, %80 : i64
    %115 = llvm.urem %114, %4 : i64
    %116 = llvm.trunc %115 : i64 to i32
    %117 = llvm.uitofp %116 : i32 to f32
    %118 = llvm.fdiv %117, %6 : f32
    %119 = llvm.fadd %118, %3 : f32
    %120 = llvm.fmul %119, %5 : f32
    %121 = llvm.intr.cos(%120) : (f32) -> f32
    %122 = llvm.intr.sin(%120) : (f32) -> f32
    %123 = llvm.fmul %93, %121 : f32
    %124 = llvm.fmul %101, %122 : f32
    %125 = llvm.fadd %123, %124 : f32
    %126 = llvm.fmul %101, %121 : f32
    %127 = llvm.fmul %93, %122 : f32
    %128 = llvm.fsub %126, %127 : f32
    %129 = llvm.fadd %107, %125 : f32
    %130 = llvm.fadd %113, %128 : f32
    %131 = llvm.mul %76, %4 overflow<nsw, nuw> : i64
    %132 = llvm.mul %78, %4 overflow<nsw, nuw> : i64
    %133 = llvm.add %131, %132 overflow<nsw, nuw> : i64
    %134 = llvm.add %133, %80 overflow<nsw, nuw> : i64
    %135 = llvm.getelementptr inbounds|nuw %19[%134] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %129, %135 : f32, !llvm.ptr
    %136 = llvm.mul %76, %4 overflow<nsw, nuw> : i64
    %137 = llvm.mul %78, %4 overflow<nsw, nuw> : i64
    %138 = llvm.add %136, %137 overflow<nsw, nuw> : i64
    %139 = llvm.add %138, %80 overflow<nsw, nuw> : i64
    %140 = llvm.getelementptr inbounds|nuw %52[%139] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %130, %140 : f32, !llvm.ptr
    %141 = llvm.add %84, %8 : i64
    llvm.br ^bb27(%141 : i64)
  ^bb29:  // pred: ^bb27
    %142 = llvm.add %82, %8 : i64
    llvm.br ^bb25(%142 : i64)
  ^bb30:  // pred: ^bb25
    %143 = llvm.add %80, %8 : i64
    llvm.br ^bb23(%143 : i64)
  ^bb31:  // pred: ^bb23
    %144 = llvm.add %78, %8 : i64
    llvm.br ^bb21(%144 : i64)
  ^bb32:  // pred: ^bb21
    %145 = llvm.add %76, %8 : i64
    llvm.br ^bb19(%145 : i64)
  ^bb33:  // pred: ^bb19
    %146 = llvm.insertvalue %28, %0[0] : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)> 
    %147 = llvm.insertvalue %61, %146[1] : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)> 
    llvm.return %147 : !llvm.struct<(struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>, struct<(ptr, ptr, i64, array<3 x i64>, array<3 x i64>)>)>
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
}

