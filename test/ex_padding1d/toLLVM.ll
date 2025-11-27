; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @memrefCopy(i64, ptr, ptr)

declare ptr @malloc(i64)

define { ptr, ptr, i64, [1 x i64], [1 x i64] } @padding1d(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i32 %5) {
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %0, 0
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, ptr %1, 1
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, i64 %2, 2
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 %3, 3, 0
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 %4, 4, 0
  %12 = sext i32 %5 to i64
  %13 = sub i64 %12, %3
  %14 = add i64 %3, %13
  %15 = getelementptr float, ptr null, i64 %14
  %16 = ptrtoint ptr %15 to i64
  %17 = add i64 %16, 64
  %18 = call ptr @malloc(i64 %17)
  %19 = ptrtoint ptr %18 to i64
  %20 = add i64 %19, 63
  %21 = urem i64 %20, 64
  %22 = sub i64 %20, %21
  %23 = inttoptr i64 %22 to ptr
  %24 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %18, 0
  %25 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %24, ptr %23, 1
  %26 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %25, i64 0, 2
  %27 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, i64 %14, 3, 0
  %28 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %27, i64 1, 4, 0
  br label %29

29:                                               ; preds = %32, %6
  %30 = phi i64 [ %34, %32 ], [ 0, %6 ]
  %31 = icmp slt i64 %30, %14
  br i1 %31, label %32, label %35

32:                                               ; preds = %29
  %33 = getelementptr inbounds nuw float, ptr %23, i64 %30
  store float 0.000000e+00, ptr %33, align 4
  %34 = add i64 %30, 1
  br label %29

35:                                               ; preds = %29
  %36 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %18, 0
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %36, ptr %23, 1
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, i64 0, 2
  %39 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, i64 %3, 3, 0
  %40 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %39, i64 1, 4, 0
  %41 = call ptr @llvm.stacksave.p0()
  %42 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, ptr %42, align 8
  %43 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %42, 1
  %44 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %40, ptr %44, align 8
  %45 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %44, 1
  %46 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %43, ptr %46, align 8
  %47 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %45, ptr %47, align 8
  call void @memrefCopy(i64 4, ptr %46, ptr %47)
  call void @llvm.stackrestore.p0(ptr %41)
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %28
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
