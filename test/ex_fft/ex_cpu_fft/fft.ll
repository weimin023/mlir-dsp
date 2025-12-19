; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

define { { ptr, ptr, i64, [3 x i64], [3 x i64] }, { ptr, ptr, i64, [3 x i64], [3 x i64] } } @tosa_fft(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, ptr %9, ptr %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16, i64 %17) {
  %19 = call ptr @malloc(i64 96)
  %20 = ptrtoint ptr %19 to i64
  %21 = add i64 %20, 63
  %22 = urem i64 %21, 64
  %23 = sub i64 %21, %22
  %24 = inttoptr i64 %23 to ptr
  %25 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } poison, ptr %19, 0
  %26 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %25, ptr %24, 1
  %27 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %26, i64 0, 2
  %28 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %27, i64 1, 3, 0
  %29 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %28, i64 1, 3, 1
  %30 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %29, i64 8, 3, 2
  %31 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %30, i64 8, 4, 0
  %32 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %31, i64 8, 4, 1
  %33 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %32, i64 1, 4, 2
  br label %34

34:                                               ; preds = %54, %18
  %35 = phi i64 [ %55, %54 ], [ 0, %18 ]
  %36 = icmp slt i64 %35, 1
  br i1 %36, label %37, label %56

37:                                               ; preds = %34
  br label %38

38:                                               ; preds = %52, %37
  %39 = phi i64 [ %53, %52 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 1
  br i1 %40, label %41, label %54

41:                                               ; preds = %38
  br label %42

42:                                               ; preds = %45, %41
  %43 = phi i64 [ %51, %45 ], [ 0, %41 ]
  %44 = icmp slt i64 %43, 8
  br i1 %44, label %45, label %52

45:                                               ; preds = %42
  %46 = mul nuw nsw i64 %35, 8
  %47 = mul nuw nsw i64 %39, 8
  %48 = add nuw nsw i64 %46, %47
  %49 = add nuw nsw i64 %48, %43
  %50 = getelementptr inbounds nuw float, ptr %24, i64 %49
  store float 0.000000e+00, ptr %50, align 4
  %51 = add i64 %43, 1
  br label %42

52:                                               ; preds = %42
  %53 = add i64 %39, 1
  br label %38

54:                                               ; preds = %38
  %55 = add i64 %35, 1
  br label %34

56:                                               ; preds = %34
  %57 = call ptr @malloc(i64 96)
  %58 = ptrtoint ptr %57 to i64
  %59 = add i64 %58, 63
  %60 = urem i64 %59, 64
  %61 = sub i64 %59, %60
  %62 = inttoptr i64 %61 to ptr
  %63 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } poison, ptr %57, 0
  %64 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %63, ptr %62, 1
  %65 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %64, i64 0, 2
  %66 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %65, i64 1, 3, 0
  %67 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %66, i64 1, 3, 1
  %68 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %67, i64 8, 3, 2
  %69 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %68, i64 8, 4, 0
  %70 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %69, i64 8, 4, 1
  %71 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %70, i64 1, 4, 2
  br label %72

72:                                               ; preds = %92, %56
  %73 = phi i64 [ %93, %92 ], [ 0, %56 ]
  %74 = icmp slt i64 %73, 1
  br i1 %74, label %75, label %94

75:                                               ; preds = %72
  br label %76

76:                                               ; preds = %90, %75
  %77 = phi i64 [ %91, %90 ], [ 0, %75 ]
  %78 = icmp slt i64 %77, 1
  br i1 %78, label %79, label %92

79:                                               ; preds = %76
  br label %80

80:                                               ; preds = %83, %79
  %81 = phi i64 [ %89, %83 ], [ 0, %79 ]
  %82 = icmp slt i64 %81, 8
  br i1 %82, label %83, label %90

83:                                               ; preds = %80
  %84 = mul nuw nsw i64 %73, 8
  %85 = mul nuw nsw i64 %77, 8
  %86 = add nuw nsw i64 %84, %85
  %87 = add nuw nsw i64 %86, %81
  %88 = getelementptr inbounds nuw float, ptr %62, i64 %87
  store float 0.000000e+00, ptr %88, align 4
  %89 = add i64 %81, 1
  br label %80

90:                                               ; preds = %80
  %91 = add i64 %77, 1
  br label %76

92:                                               ; preds = %76
  %93 = add i64 %73, 1
  br label %72

94:                                               ; preds = %72
  br label %95

95:                                               ; preds = %177, %94
  %96 = phi i64 [ %178, %177 ], [ 0, %94 ]
  %97 = icmp slt i64 %96, 1
  br i1 %97, label %98, label %179

98:                                               ; preds = %95
  br label %99

99:                                               ; preds = %175, %98
  %100 = phi i64 [ %176, %175 ], [ 0, %98 ]
  %101 = icmp slt i64 %100, 1
  br i1 %101, label %102, label %177

102:                                              ; preds = %99
  br label %103

103:                                              ; preds = %173, %102
  %104 = phi i64 [ %174, %173 ], [ 0, %102 ]
  %105 = icmp slt i64 %104, 8
  br i1 %105, label %106, label %175

106:                                              ; preds = %103
  br label %107

107:                                              ; preds = %171, %106
  %108 = phi i64 [ %172, %171 ], [ 0, %106 ]
  %109 = icmp slt i64 %108, 1
  br i1 %109, label %110, label %173

110:                                              ; preds = %107
  br label %111

111:                                              ; preds = %114, %110
  %112 = phi i64 [ %170, %114 ], [ 0, %110 ]
  %113 = icmp slt i64 %112, 8
  br i1 %113, label %114, label %171

114:                                              ; preds = %111
  %115 = getelementptr float, ptr %1, i64 %2
  %116 = mul nuw nsw i64 %96, %6
  %117 = mul nuw nsw i64 %108, %7
  %118 = add nuw nsw i64 %116, %117
  %119 = mul nuw nsw i64 %112, %8
  %120 = add nuw nsw i64 %118, %119
  %121 = getelementptr inbounds nuw float, ptr %115, i64 %120
  %122 = load float, ptr %121, align 4
  %123 = getelementptr float, ptr %10, i64 %11
  %124 = mul nuw nsw i64 %96, %15
  %125 = mul nuw nsw i64 %108, %16
  %126 = add nuw nsw i64 %124, %125
  %127 = mul nuw nsw i64 %112, %17
  %128 = add nuw nsw i64 %126, %127
  %129 = getelementptr inbounds nuw float, ptr %123, i64 %128
  %130 = load float, ptr %129, align 4
  %131 = mul nuw nsw i64 %96, 8
  %132 = mul nuw nsw i64 %100, 8
  %133 = add nuw nsw i64 %131, %132
  %134 = add nuw nsw i64 %133, %104
  %135 = getelementptr inbounds nuw float, ptr %24, i64 %134
  %136 = load float, ptr %135, align 4
  %137 = mul nuw nsw i64 %96, 8
  %138 = mul nuw nsw i64 %100, 8
  %139 = add nuw nsw i64 %137, %138
  %140 = add nuw nsw i64 %139, %104
  %141 = getelementptr inbounds nuw float, ptr %62, i64 %140
  %142 = load float, ptr %141, align 4
  %143 = mul i64 %112, %104
  %144 = urem i64 %143, 8
  %145 = trunc i64 %144 to i32
  %146 = uitofp i32 %145 to float
  %147 = fdiv float %146, 8.000000e+00
  %148 = fadd float %147, 0.000000e+00
  %149 = fmul float %148, 0x401921FB60000000
  %150 = call float @llvm.cos.f32(float %149)
  %151 = call float @llvm.sin.f32(float %149)
  %152 = fmul float %122, %150
  %153 = fmul float %130, %151
  %154 = fadd float %152, %153
  %155 = fmul float %130, %150
  %156 = fmul float %122, %151
  %157 = fsub float %155, %156
  %158 = fadd float %136, %154
  %159 = fadd float %142, %157
  %160 = mul nuw nsw i64 %96, 8
  %161 = mul nuw nsw i64 %100, 8
  %162 = add nuw nsw i64 %160, %161
  %163 = add nuw nsw i64 %162, %104
  %164 = getelementptr inbounds nuw float, ptr %24, i64 %163
  store float %158, ptr %164, align 4
  %165 = mul nuw nsw i64 %96, 8
  %166 = mul nuw nsw i64 %100, 8
  %167 = add nuw nsw i64 %165, %166
  %168 = add nuw nsw i64 %167, %104
  %169 = getelementptr inbounds nuw float, ptr %62, i64 %168
  store float %159, ptr %169, align 4
  %170 = add i64 %112, 1
  br label %111

171:                                              ; preds = %111
  %172 = add i64 %108, 1
  br label %107

173:                                              ; preds = %107
  %174 = add i64 %104, 1
  br label %103

175:                                              ; preds = %103
  %176 = add i64 %100, 1
  br label %99

177:                                              ; preds = %99
  %178 = add i64 %96, 1
  br label %95

179:                                              ; preds = %95
  %180 = insertvalue { { ptr, ptr, i64, [3 x i64], [3 x i64] }, { ptr, ptr, i64, [3 x i64], [3 x i64] } } poison, { ptr, ptr, i64, [3 x i64], [3 x i64] } %33, 0
  %181 = insertvalue { { ptr, ptr, i64, [3 x i64], [3 x i64] }, { ptr, ptr, i64, [3 x i64], [3 x i64] } } %180, { ptr, ptr, i64, [3 x i64], [3 x i64] } %71, 1
  ret { { ptr, ptr, i64, [3 x i64], [3 x i64] }, { ptr, ptr, i64, [3 x i64], [3 x i64] } } %181
}

define void @_mlir_ciface_tosa_fft(ptr %0, ptr %1, ptr %2) {
  %4 = load { ptr, ptr, i64, [3 x i64], [3 x i64] }, ptr %1, align 8
  %5 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 0
  %6 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 1
  %7 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 2
  %8 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 3, 0
  %9 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 3, 1
  %10 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 3, 2
  %11 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 4, 0
  %12 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 4, 1
  %13 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, 4, 2
  %14 = load { ptr, ptr, i64, [3 x i64], [3 x i64] }, ptr %2, align 8
  %15 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 0
  %16 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 1
  %17 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 2
  %18 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 3, 0
  %19 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 3, 1
  %20 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 3, 2
  %21 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 4, 0
  %22 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 4, 1
  %23 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, 4, 2
  %24 = call { { ptr, ptr, i64, [3 x i64], [3 x i64] }, { ptr, ptr, i64, [3 x i64], [3 x i64] } } @tosa_fft(ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, ptr %15, ptr %16, i64 %17, i64 %18, i64 %19, i64 %20, i64 %21, i64 %22, i64 %23)
  store { { ptr, ptr, i64, [3 x i64], [3 x i64] }, { ptr, ptr, i64, [3 x i64], [3 x i64] } } %24, ptr %0, align 8
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.cos.f32(float) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sin.f32(float) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
