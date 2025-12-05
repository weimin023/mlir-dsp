module {
  llvm.func @memrefCopy(i64, !llvm.ptr, !llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @padding1d(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(i64, ptr)>
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(64 : index) : i64
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %8 = llvm.insertvalue %arg0, %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg1, %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg2, %9[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg3, %10[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg4, %11[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.add %arg3, %arg5 : i64
    %14 = llvm.getelementptr %3[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.ptrtoint %14 : !llvm.ptr to i64
    %16 = llvm.add %15, %2 : i64
    %17 = llvm.call @malloc(%16) : (i64) -> !llvm.ptr
    %18 = llvm.ptrtoint %17 : !llvm.ptr to i64
    %19 = llvm.sub %2, %6 : i64
    %20 = llvm.add %18, %19 : i64
    %21 = llvm.urem %20, %2 : i64
    %22 = llvm.sub %20, %21 : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr
    %24 = llvm.insertvalue %17, %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.insertvalue %23, %24[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %5, %25[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %13, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %6, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%5 : i64)
  ^bb1(%29: i64):  // 2 preds: ^bb0, ^bb2
    %30 = llvm.icmp "slt" %29, %13 : i64
    llvm.cond_br %30, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %31 = llvm.getelementptr inbounds|nuw %23[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %4, %31 : f32, !llvm.ptr
    %32 = llvm.add %29, %6 : i64
    llvm.br ^bb1(%32 : i64)
  ^bb3:  // pred: ^bb1
    %33 = llvm.insertvalue %17, %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %23, %33[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %5, %34[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %arg3, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %6, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.intr.stacksave : !llvm.ptr
    %39 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %12, %39 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %40 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, ptr)> 
    %41 = llvm.insertvalue %39, %40[1] : !llvm.struct<(i64, ptr)> 
    %42 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %37, %42 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %43 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, ptr)> 
    %44 = llvm.insertvalue %42, %43[1] : !llvm.struct<(i64, ptr)> 
    %45 = llvm.alloca %6 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %41, %45 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %46 = llvm.alloca %6 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %44, %46 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %47 = llvm.getelementptr %3[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %48 = llvm.ptrtoint %47 : !llvm.ptr to i64
    llvm.call @memrefCopy(%48, %45, %46) : (i64, !llvm.ptr, !llvm.ptr) -> ()
    llvm.intr.stackrestore %38 : !llvm.ptr
    llvm.return %28 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @elementwise_mul(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(i64, ptr)>
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.zero : !llvm.ptr
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %6 = llvm.insertvalue %arg0, %5[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.insertvalue %arg1, %6[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %arg2, %7[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg3, %8[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg4, %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%3 : i64)
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb2
    %12 = llvm.icmp "slt" %11, %arg3 : i64
    llvm.cond_br %12, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %13 = llvm.getelementptr %arg1[%arg2] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %14 = llvm.mul %11, %arg4 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds|nuw %13[%14] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %16 = llvm.load %15 : !llvm.ptr -> f32
    %17 = llvm.getelementptr %arg6[%arg7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.mul %11, %arg9 overflow<nsw, nuw> : i64
    %19 = llvm.getelementptr inbounds|nuw %17[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = llvm.fmul %16, %20 : f32
    %22 = llvm.getelementptr %arg1[%arg2] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %23 = llvm.mul %11, %arg4 overflow<nsw, nuw> : i64
    %24 = llvm.getelementptr inbounds|nuw %22[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %21, %24 : f32, !llvm.ptr
    %25 = llvm.add %11, %4 : i64
    llvm.br ^bb1(%25 : i64)
  ^bb3:  // pred: ^bb1
    %26 = llvm.getelementptr %2[%arg3] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %27 = llvm.ptrtoint %26 : !llvm.ptr to i64
    %28 = llvm.call @malloc(%27) : (i64) -> !llvm.ptr
    %29 = llvm.insertvalue %28, %5[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.insertvalue %28, %29[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.insertvalue %3, %30[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.insertvalue %arg3, %31[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.insertvalue %4, %32[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.intr.stacksave : !llvm.ptr
    %35 = llvm.alloca %4 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %10, %35 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %36 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, ptr)> 
    %37 = llvm.insertvalue %35, %36[1] : !llvm.struct<(i64, ptr)> 
    %38 = llvm.alloca %4 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %33, %38 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %39 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, ptr)> 
    %40 = llvm.insertvalue %38, %39[1] : !llvm.struct<(i64, ptr)> 
    %41 = llvm.alloca %4 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %37, %41 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %42 = llvm.alloca %4 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %40, %42 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %43 = llvm.getelementptr %2[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %44 = llvm.ptrtoint %43 : !llvm.ptr to i64
    llvm.call @memrefCopy(%44, %41, %42) : (i64, !llvm.ptr, !llvm.ptr) -> ()
    llvm.intr.stackrestore %34 : !llvm.ptr
    llvm.return %33 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @dynamic_padding_and_mul_filter_auto_reuse(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.poison : !llvm.struct<(i64, ptr)>
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(64 : index) : i64
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %8 = llvm.insertvalue %arg0, %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg1, %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg2, %9[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg3, %10[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg4, %11[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.add %arg3, %arg10 : i64
    %14 = llvm.getelementptr %3[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.ptrtoint %14 : !llvm.ptr to i64
    %16 = llvm.add %15, %2 : i64
    %17 = llvm.call @malloc(%16) : (i64) -> !llvm.ptr
    %18 = llvm.ptrtoint %17 : !llvm.ptr to i64
    %19 = llvm.sub %2, %6 : i64
    %20 = llvm.add %18, %19 : i64
    %21 = llvm.urem %20, %2 : i64
    %22 = llvm.sub %20, %21 : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr
    %24 = llvm.insertvalue %17, %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.insertvalue %23, %24[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %5, %25[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %13, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %6, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%5 : i64)
  ^bb1(%29: i64):  // 2 preds: ^bb0, ^bb2
    %30 = llvm.icmp "slt" %29, %13 : i64
    llvm.cond_br %30, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %31 = llvm.getelementptr inbounds|nuw %23[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %4, %31 : f32, !llvm.ptr
    %32 = llvm.add %29, %6 : i64
    llvm.br ^bb1(%32 : i64)
  ^bb3:  // pred: ^bb1
    %33 = llvm.insertvalue %17, %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %23, %33[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %5, %34[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %arg3, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %6, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.intr.stacksave : !llvm.ptr
    %39 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %12, %39 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %40 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, ptr)> 
    %41 = llvm.insertvalue %39, %40[1] : !llvm.struct<(i64, ptr)> 
    %42 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %37, %42 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %43 = llvm.insertvalue %1, %0[0] : !llvm.struct<(i64, ptr)> 
    %44 = llvm.insertvalue %42, %43[1] : !llvm.struct<(i64, ptr)> 
    %45 = llvm.alloca %6 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %41, %45 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %46 = llvm.alloca %6 x !llvm.struct<(i64, ptr)> : (i64) -> !llvm.ptr
    llvm.store %44, %46 : !llvm.struct<(i64, ptr)>, !llvm.ptr
    %47 = llvm.getelementptr %3[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %48 = llvm.ptrtoint %47 : !llvm.ptr to i64
    llvm.call @memrefCopy(%48, %45, %46) : (i64, !llvm.ptr, !llvm.ptr) -> ()
    llvm.intr.stackrestore %38 : !llvm.ptr
    llvm.br ^bb4(%5 : i64)
  ^bb4(%49: i64):  // 2 preds: ^bb3, ^bb5
    %50 = llvm.icmp "slt" %49, %13 : i64
    llvm.cond_br %50, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %51 = llvm.getelementptr inbounds|nuw %23[%49] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %52 = llvm.load %51 : !llvm.ptr -> f32
    %53 = llvm.getelementptr %arg6[%arg7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %54 = llvm.mul %49, %arg9 overflow<nsw, nuw> : i64
    %55 = llvm.getelementptr inbounds|nuw %53[%54] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %56 = llvm.load %55 : !llvm.ptr -> f32
    %57 = llvm.fmul %52, %56 : f32
    %58 = llvm.getelementptr inbounds|nuw %23[%49] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %57, %58 : f32, !llvm.ptr
    %59 = llvm.add %49, %6 : i64
    llvm.br ^bb4(%59 : i64)
  ^bb6:  // pred: ^bb4
    llvm.return %28 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
}

