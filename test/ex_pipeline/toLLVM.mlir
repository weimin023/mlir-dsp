module {
  llvm.func @free(!llvm.ptr)
  llvm.func @memrefCopy(i64, !llvm.ptr, !llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @pipeline(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr, %arg8: !llvm.ptr, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.constant(10 : index) : i64
    %1 = llvm.mlir.poison : !llvm.struct<(i64, ptr)>
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.constant(5 : index) : i64
    %4 = llvm.mlir.constant(20 : index) : i64
    %5 = llvm.mlir.constant(64 : index) : i64
    %6 = llvm.mlir.zero : !llvm.ptr
    %7 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %8 = llvm.mlir.constant(0 : index) : i64
    %9 = llvm.mlir.constant(9 : index) : i64
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.mlir.constant(7 : index) : i64
    %12 = llvm.mlir.constant(3 : index) : i64
    %13 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg0, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg2, %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %arg3, %16[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg5, %17[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg4, %18[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg6, %19[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.getelementptr %6[81] : (!llvm.ptr) -> !llvm.ptr, f32
    %22 = llvm.ptrtoint %21 : !llvm.ptr to i64
    %23 = llvm.add %22, %5 : i64
    %24 = llvm.call @malloc(%23) : (i64) -> !llvm.ptr
    %25 = llvm.ptrtoint %24 : !llvm.ptr to i64
    %26 = llvm.sub %5, %10 : i64
    %27 = llvm.add %25, %26 : i64
    %28 = llvm.urem %27, %5 : i64
    %29 = llvm.sub %27, %28 : i64
    %30 = llvm.inttoptr %29 : i64 to !llvm.ptr
    %31 = llvm.insertvalue %24, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %30, %31[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %8, %32[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %9, %33[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %9, %34[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %9, %35[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %10, %36[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%8 : i64)
  ^bb1(%38: i64):  // 2 preds: ^bb0, ^bb5
    %39 = llvm.icmp "slt" %38, %9 : i64
    llvm.cond_br %39, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%8 : i64)
  ^bb3(%40: i64):  // 2 preds: ^bb2, ^bb4
    %41 = llvm.icmp "slt" %40, %9 : i64
    llvm.cond_br %41, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %42 = llvm.mul %38, %9 overflow<nsw, nuw> : i64
    %43 = llvm.add %42, %40 overflow<nsw, nuw> : i64
    %44 = llvm.getelementptr inbounds|nuw %30[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %44 : f32, !llvm.ptr
    %45 = llvm.add %40, %10 : i64
    llvm.br ^bb3(%45 : i64)
  ^bb5:  // pred: ^bb3
    %46 = llvm.add %38, %10 : i64
    llvm.br ^bb1(%46 : i64)
  ^bb6:  // pred: ^bb1
    %47 = llvm.insertvalue %24, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %30, %47[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %4, %48[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %3, %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %9, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %3, %51[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %10, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.intr.stacksave : !llvm.ptr
    %55 = llvm.alloca %10 x !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %20, %55 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
    %56 = llvm.insertvalue %2, %1[0] : !llvm.struct<(i64, ptr)> 
    %57 = llvm.insertvalue %55, %56[1] : !llvm.struct<(i64, ptr)> 
    %58 = llvm.alloca %10 x !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %53, %58 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
    %59 = llvm.insertvalue %2, %1[0] : !llvm.struct<(i64, ptr)> 
    %60 = llvm.insertvalue %58, %59[1] : !llvm.struct<(i64, ptr)> 
    %61 = llvm.alloca %10 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %57, %61 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %62 = llvm.alloca %10 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %60, %62 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %63 = llvm.getelementptr %6[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %64 = llvm.ptrtoint %63 : !llvm.ptr to i64
    llvm.call @memrefCopy(%64, %61, %62) : (i64, !llvm.ptr, !llvm.ptr) -> ()
    llvm.intr.stackrestore %54 : !llvm.ptr
    %65 = llvm.getelementptr %6[49] : (!llvm.ptr) -> !llvm.ptr, f32
    %66 = llvm.ptrtoint %65 : !llvm.ptr to i64
    %67 = llvm.add %66, %5 : i64
    %68 = llvm.call @malloc(%67) : (i64) -> !llvm.ptr
    %69 = llvm.ptrtoint %68 : !llvm.ptr to i64
    %70 = llvm.sub %5, %10 : i64
    %71 = llvm.add %69, %70 : i64
    %72 = llvm.urem %71, %5 : i64
    %73 = llvm.sub %71, %72 : i64
    %74 = llvm.inttoptr %73 : i64 to !llvm.ptr
    %75 = llvm.insertvalue %68, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = llvm.insertvalue %74, %75[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %77 = llvm.insertvalue %8, %76[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %78 = llvm.insertvalue %11, %77[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %79 = llvm.insertvalue %11, %78[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %80 = llvm.insertvalue %11, %79[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %81 = llvm.insertvalue %10, %80[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb7(%8 : i64)
  ^bb7(%82: i64):  // 2 preds: ^bb6, ^bb11
    %83 = llvm.icmp "slt" %82, %11 : i64
    llvm.cond_br %83, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%8 : i64)
  ^bb9(%84: i64):  // 2 preds: ^bb8, ^bb10
    %85 = llvm.icmp "slt" %84, %11 : i64
    llvm.cond_br %85, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %86 = llvm.mul %82, %11 overflow<nsw, nuw> : i64
    %87 = llvm.add %86, %84 overflow<nsw, nuw> : i64
    %88 = llvm.getelementptr inbounds|nuw %74[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %88 : f32, !llvm.ptr
    %89 = llvm.add %84, %10 : i64
    llvm.br ^bb9(%89 : i64)
  ^bb11:  // pred: ^bb9
    %90 = llvm.add %82, %10 : i64
    llvm.br ^bb7(%90 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%8 : i64)
  ^bb13(%91: i64):  // 2 preds: ^bb12, ^bb23
    %92 = llvm.icmp "slt" %91, %11 : i64
    llvm.cond_br %92, ^bb14, ^bb24
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%8 : i64)
  ^bb15(%93: i64):  // 2 preds: ^bb14, ^bb22
    %94 = llvm.icmp "slt" %93, %11 : i64
    llvm.cond_br %94, ^bb16, ^bb23
  ^bb16:  // pred: ^bb15
    llvm.br ^bb17(%8 : i64)
  ^bb17(%95: i64):  // 2 preds: ^bb16, ^bb21
    %96 = llvm.icmp "slt" %95, %12 : i64
    llvm.cond_br %96, ^bb18, ^bb22
  ^bb18:  // pred: ^bb17
    llvm.br ^bb19(%8 : i64)
  ^bb19(%97: i64):  // 2 preds: ^bb18, ^bb20
    %98 = llvm.icmp "slt" %97, %12 : i64
    llvm.cond_br %98, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %99 = llvm.add %91, %95 : i64
    %100 = llvm.add %93, %97 : i64
    %101 = llvm.mul %99, %9 overflow<nsw, nuw> : i64
    %102 = llvm.add %101, %100 overflow<nsw, nuw> : i64
    %103 = llvm.getelementptr inbounds|nuw %30[%102] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %104 = llvm.load %103 : !llvm.ptr -> f32
    %105 = llvm.getelementptr %arg8[%arg9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %106 = llvm.mul %95, %arg12 overflow<nsw, nuw> : i64
    %107 = llvm.mul %97, %arg13 overflow<nsw, nuw> : i64
    %108 = llvm.add %106, %107 overflow<nsw, nuw> : i64
    %109 = llvm.getelementptr inbounds|nuw %105[%108] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %110 = llvm.load %109 : !llvm.ptr -> f32
    %111 = llvm.mul %91, %11 overflow<nsw, nuw> : i64
    %112 = llvm.add %111, %93 overflow<nsw, nuw> : i64
    %113 = llvm.getelementptr inbounds|nuw %74[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fmul %104, %110 : f32
    %116 = llvm.fadd %114, %115 : f32
    %117 = llvm.mul %91, %11 overflow<nsw, nuw> : i64
    %118 = llvm.add %117, %93 overflow<nsw, nuw> : i64
    %119 = llvm.getelementptr inbounds|nuw %74[%118] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %116, %119 : f32, !llvm.ptr
    %120 = llvm.add %97, %10 : i64
    llvm.br ^bb19(%120 : i64)
  ^bb21:  // pred: ^bb19
    %121 = llvm.add %95, %10 : i64
    llvm.br ^bb17(%121 : i64)
  ^bb22:  // pred: ^bb17
    %122 = llvm.add %93, %10 : i64
    llvm.br ^bb15(%122 : i64)
  ^bb23:  // pred: ^bb15
    %123 = llvm.add %91, %10 : i64
    llvm.br ^bb13(%123 : i64)
  ^bb24:  // pred: ^bb13
    llvm.br ^bb25(%8 : i64)
  ^bb25(%124: i64):  // 2 preds: ^bb24, ^bb29
    %125 = llvm.icmp "slt" %124, %9 : i64
    llvm.cond_br %125, ^bb26, ^bb30
  ^bb26:  // pred: ^bb25
    llvm.br ^bb27(%8 : i64)
  ^bb27(%126: i64):  // 2 preds: ^bb26, ^bb28
    %127 = llvm.icmp "slt" %126, %9 : i64
    llvm.cond_br %127, ^bb28, ^bb29
  ^bb28:  // pred: ^bb27
    %128 = llvm.mul %124, %9 overflow<nsw, nuw> : i64
    %129 = llvm.add %128, %126 overflow<nsw, nuw> : i64
    %130 = llvm.getelementptr inbounds|nuw %30[%129] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %130 : f32, !llvm.ptr
    %131 = llvm.add %126, %10 : i64
    llvm.br ^bb27(%131 : i64)
  ^bb29:  // pred: ^bb27
    %132 = llvm.add %124, %10 : i64
    llvm.br ^bb25(%132 : i64)
  ^bb30:  // pred: ^bb25
    %133 = llvm.insertvalue %24, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.insertvalue %30, %133[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.insertvalue %0, %134[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %136 = llvm.insertvalue %11, %135[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %137 = llvm.insertvalue %9, %136[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.insertvalue %11, %137[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %139 = llvm.insertvalue %10, %138[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %140 = llvm.intr.stacksave : !llvm.ptr
    %141 = llvm.alloca %10 x !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %81, %141 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
    %142 = llvm.insertvalue %2, %1[0] : !llvm.struct<(i64, ptr)> 
    %143 = llvm.insertvalue %141, %142[1] : !llvm.struct<(i64, ptr)> 
    %144 = llvm.alloca %10 x !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %139, %144 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
    %145 = llvm.insertvalue %2, %1[0] : !llvm.struct<(i64, ptr)> 
    %146 = llvm.insertvalue %144, %145[1] : !llvm.struct<(i64, ptr)> 
    %147 = llvm.alloca %10 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %143, %147 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %148 = llvm.alloca %10 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %146, %148 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %149 = llvm.getelementptr %6[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %150 = llvm.ptrtoint %149 : !llvm.ptr to i64
    llvm.call @memrefCopy(%150, %147, %148) : (i64, !llvm.ptr, !llvm.ptr) -> ()
    llvm.intr.stackrestore %140 : !llvm.ptr
    llvm.call @free(%68) : (!llvm.ptr) -> ()
    llvm.return %37 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
}

