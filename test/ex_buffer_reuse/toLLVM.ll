; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @memrefCopy(i64, ptr, ptr)

declare ptr @malloc(i64)

define { ptr, ptr, i64, [1 x i64], [1 x i64] } @padding1d(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5) {
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %0, 0
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, ptr %1, 1
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, i64 %2, 2
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 %3, 3, 0
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 %4, 4, 0
  %12 = add i64 %3, %5
  %13 = getelementptr float, ptr null, i64 %12
  %14 = ptrtoint ptr %13 to i64
  %15 = add i64 %14, 64
  %16 = call ptr @malloc(i64 %15)
  %17 = ptrtoint ptr %16 to i64
  %18 = add i64 %17, 63
  %19 = urem i64 %18, 64
  %20 = sub i64 %18, %19
  %21 = inttoptr i64 %20 to ptr
  %22 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %16, 0
  %23 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, ptr %21, 1
  %24 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %23, i64 0, 2
  %25 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %24, i64 %12, 3, 0
  %26 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %25, i64 1, 4, 0
  br label %27

27:                                               ; preds = %30, %6
  %28 = phi i64 [ %32, %30 ], [ 0, %6 ]
  %29 = icmp slt i64 %28, %12
  br i1 %29, label %30, label %33

30:                                               ; preds = %27
  %31 = getelementptr inbounds nuw float, ptr %21, i64 %28
  store float 0.000000e+00, ptr %31, align 4
  %32 = add i64 %28, 1
  br label %27

33:                                               ; preds = %27
  %34 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %16, 0
  %35 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %34, ptr %21, 1
  %36 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %35, i64 0, 2
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %36, i64 %3, 3, 0
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, i64 1, 4, 0
  %39 = call ptr @llvm.stacksave.p0()
  %40 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, ptr %40, align 8
  %41 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %40, 1
  %42 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, ptr %42, align 8
  %43 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %42, 1
  %44 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %41, ptr %44, align 8
  %45 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %43, ptr %45, align 8
  call void @memrefCopy(i64 4, ptr %44, ptr %45)
  call void @llvm.stackrestore.p0(ptr %39)
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %26
}

define { ptr, ptr, i64, [1 x i64], [1 x i64] } @elementwise_mul(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9) {
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %0, 0
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, ptr %1, 1
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 %2, 2
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 %3, 3, 0
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, i64 %4, 4, 0
  br label %16

16:                                               ; preds = %19, %10
  %17 = phi i64 [ %32, %19 ], [ 0, %10 ]
  %18 = icmp slt i64 %17, %3
  br i1 %18, label %19, label %33

19:                                               ; preds = %16
  %20 = getelementptr float, ptr %1, i64 %2
  %21 = mul nuw nsw i64 %17, %4
  %22 = getelementptr inbounds nuw float, ptr %20, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = getelementptr float, ptr %6, i64 %7
  %25 = mul nuw nsw i64 %17, %9
  %26 = getelementptr inbounds nuw float, ptr %24, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fmul float %23, %27
  %29 = getelementptr float, ptr %1, i64 %2
  %30 = mul nuw nsw i64 %17, %4
  %31 = getelementptr inbounds nuw float, ptr %29, i64 %30
  store float %28, ptr %31, align 4
  %32 = add i64 %17, 1
  br label %16

33:                                               ; preds = %16
  %34 = getelementptr float, ptr null, i64 %3
  %35 = ptrtoint ptr %34 to i64
  %36 = call ptr @malloc(i64 %35)
  %37 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %36, 0
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %37, ptr %36, 1
  %39 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, i64 0, 2
  %40 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %39, i64 %3, 3, 0
  %41 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %40, i64 1, 4, 0
  %42 = call ptr @llvm.stacksave.p0()
  %43 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, ptr %43, align 8
  %44 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %43, 1
  %45 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %41, ptr %45, align 8
  %46 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %45, 1
  %47 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %44, ptr %47, align 8
  %48 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %46, ptr %48, align 8
  call void @memrefCopy(i64 4, ptr %47, ptr %48)
  call void @llvm.stackrestore.p0(ptr %42)
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %41
}

define { ptr, ptr, i64, [1 x i64], [1 x i64] } @dynamic_padding_and_mul_filter_auto_reuse(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, i64 %10) {
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %0, 0
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, ptr %1, 1
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 %2, 2
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, i64 %3, 3, 0
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 %4, 4, 0
  %17 = add i64 %3, %10
  %18 = getelementptr float, ptr null, i64 %17
  %19 = ptrtoint ptr %18 to i64
  %20 = add i64 %19, 64
  %21 = call ptr @malloc(i64 %20)
  %22 = ptrtoint ptr %21 to i64
  %23 = add i64 %22, 63
  %24 = urem i64 %23, 64
  %25 = sub i64 %23, %24
  %26 = inttoptr i64 %25 to ptr
  %27 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %21, 0
  %28 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %27, ptr %26, 1
  %29 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %28, i64 0, 2
  %30 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %29, i64 %17, 3, 0
  %31 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %30, i64 1, 4, 0
  br label %32

32:                                               ; preds = %35, %11
  %33 = phi i64 [ %37, %35 ], [ 0, %11 ]
  %34 = icmp slt i64 %33, %17
  br i1 %34, label %35, label %38

35:                                               ; preds = %32
  %36 = getelementptr inbounds nuw float, ptr %26, i64 %33
  store float 0.000000e+00, ptr %36, align 4
  %37 = add i64 %33, 1
  br label %32

38:                                               ; preds = %32
  %39 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } poison, ptr %21, 0
  %40 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %39, ptr %26, 1
  %41 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %40, i64 0, 2
  %42 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %41, i64 %3, 3, 0
  %43 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %42, i64 1, 4, 0
  %44 = call ptr @llvm.stacksave.p0()
  %45 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, ptr %45, align 8
  %46 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %45, 1
  %47 = alloca { ptr, ptr, i64, [1 x i64], [1 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [1 x i64], [1 x i64] } %43, ptr %47, align 8
  %48 = insertvalue { i64, ptr } { i64 1, ptr poison }, ptr %47, 1
  %49 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %46, ptr %49, align 8
  %50 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %48, ptr %50, align 8
  call void @memrefCopy(i64 4, ptr %49, ptr %50)
  call void @llvm.stackrestore.p0(ptr %44)
  br label %51

51:                                               ; preds = %54, %38
  %52 = phi i64 [ %63, %54 ], [ 0, %38 ]
  %53 = icmp slt i64 %52, %17
  br i1 %53, label %54, label %64

54:                                               ; preds = %51
  %55 = getelementptr inbounds nuw float, ptr %26, i64 %52
  %56 = load float, ptr %55, align 4
  %57 = getelementptr float, ptr %6, i64 %7
  %58 = mul nuw nsw i64 %52, %9
  %59 = getelementptr inbounds nuw float, ptr %57, i64 %58
  %60 = load float, ptr %59, align 4
  %61 = fmul float %56, %60
  %62 = getelementptr inbounds nuw float, ptr %26, i64 %52
  store float %61, ptr %62, align 4
  %63 = add i64 %52, 1
  br label %51

64:                                               ; preds = %51
  ret { ptr, ptr, i64, [1 x i64], [1 x i64] } %31
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
