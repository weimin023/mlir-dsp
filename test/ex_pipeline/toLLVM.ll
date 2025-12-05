; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare void @free(ptr)

declare void @memrefCopy(i64, ptr, ptr)

declare ptr @malloc(i64)

define { ptr, ptr, i64, [2 x i64], [2 x i64] } @pipeline(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) {
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %0, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, ptr %1, 1
  %17 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, i64 %2, 2
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, i64 %3, 3, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, i64 %5, 4, 0
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 %4, 3, 1
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 %6, 4, 1
  %22 = call ptr @malloc(i64 388)
  %23 = ptrtoint ptr %22 to i64
  %24 = add i64 %23, 63
  %25 = urem i64 %24, 64
  %26 = sub i64 %24, %25
  %27 = inttoptr i64 %26 to ptr
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %22, 0
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, ptr %27, 1
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 0, 2
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 9, 3, 0
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 9, 3, 1
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, i64 9, 4, 0
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, i64 1, 4, 1
  br label %35

35:                                               ; preds = %47, %14
  %36 = phi i64 [ %48, %47 ], [ 0, %14 ]
  %37 = icmp slt i64 %36, 9
  br i1 %37, label %38, label %49

38:                                               ; preds = %35
  br label %39

39:                                               ; preds = %42, %38
  %40 = phi i64 [ %46, %42 ], [ 0, %38 ]
  %41 = icmp slt i64 %40, 9
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = mul nuw nsw i64 %36, 9
  %44 = add nuw nsw i64 %43, %40
  %45 = getelementptr inbounds nuw float, ptr %27, i64 %44
  store float 0.000000e+00, ptr %45, align 4
  %46 = add i64 %40, 1
  br label %39

47:                                               ; preds = %39
  %48 = add i64 %36, 1
  br label %35

49:                                               ; preds = %35
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %22, 0
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, ptr %27, 1
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, i64 20, 2
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, i64 5, 3, 0
  %54 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, i64 9, 4, 0
  %55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %54, i64 5, 3, 1
  %56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %55, i64 1, 4, 1
  %57 = call ptr @llvm.stacksave.p0()
  %58 = alloca { ptr, ptr, i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, ptr %58, align 8
  %59 = insertvalue { i64, ptr } { i64 2, ptr poison }, ptr %58, 1
  %60 = alloca { ptr, ptr, i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %56, ptr %60, align 8
  %61 = insertvalue { i64, ptr } { i64 2, ptr poison }, ptr %60, 1
  %62 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %59, ptr %62, align 8
  %63 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %61, ptr %63, align 8
  call void @memrefCopy(i64 4, ptr %62, ptr %63)
  call void @llvm.stackrestore.p0(ptr %57)
  %64 = call ptr @malloc(i64 260)
  %65 = ptrtoint ptr %64 to i64
  %66 = add i64 %65, 63
  %67 = urem i64 %66, 64
  %68 = sub i64 %66, %67
  %69 = inttoptr i64 %68 to ptr
  %70 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %64, 0
  %71 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %70, ptr %69, 1
  %72 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %71, i64 0, 2
  %73 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %72, i64 7, 3, 0
  %74 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %73, i64 7, 3, 1
  %75 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %74, i64 7, 4, 0
  %76 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %75, i64 1, 4, 1
  br label %77

77:                                               ; preds = %89, %49
  %78 = phi i64 [ %90, %89 ], [ 0, %49 ]
  %79 = icmp slt i64 %78, 7
  br i1 %79, label %80, label %91

80:                                               ; preds = %77
  br label %81

81:                                               ; preds = %84, %80
  %82 = phi i64 [ %88, %84 ], [ 0, %80 ]
  %83 = icmp slt i64 %82, 7
  br i1 %83, label %84, label %89

84:                                               ; preds = %81
  %85 = mul nuw nsw i64 %78, 7
  %86 = add nuw nsw i64 %85, %82
  %87 = getelementptr inbounds nuw float, ptr %69, i64 %86
  store float 0.000000e+00, ptr %87, align 4
  %88 = add i64 %82, 1
  br label %81

89:                                               ; preds = %81
  %90 = add i64 %78, 1
  br label %77

91:                                               ; preds = %77
  br label %92

92:                                               ; preds = %134, %91
  %93 = phi i64 [ %135, %134 ], [ 0, %91 ]
  %94 = icmp slt i64 %93, 7
  br i1 %94, label %95, label %136

95:                                               ; preds = %92
  br label %96

96:                                               ; preds = %132, %95
  %97 = phi i64 [ %133, %132 ], [ 0, %95 ]
  %98 = icmp slt i64 %97, 7
  br i1 %98, label %99, label %134

99:                                               ; preds = %96
  br label %100

100:                                              ; preds = %130, %99
  %101 = phi i64 [ %131, %130 ], [ 0, %99 ]
  %102 = icmp slt i64 %101, 3
  br i1 %102, label %103, label %132

103:                                              ; preds = %100
  br label %104

104:                                              ; preds = %107, %103
  %105 = phi i64 [ %129, %107 ], [ 0, %103 ]
  %106 = icmp slt i64 %105, 3
  br i1 %106, label %107, label %130

107:                                              ; preds = %104
  %108 = add i64 %93, %101
  %109 = add i64 %97, %105
  %110 = mul nuw nsw i64 %108, 9
  %111 = add nuw nsw i64 %110, %109
  %112 = getelementptr inbounds nuw float, ptr %27, i64 %111
  %113 = load float, ptr %112, align 4
  %114 = getelementptr float, ptr %8, i64 %9
  %115 = mul nuw nsw i64 %101, %12
  %116 = mul nuw nsw i64 %105, %13
  %117 = add nuw nsw i64 %115, %116
  %118 = getelementptr inbounds nuw float, ptr %114, i64 %117
  %119 = load float, ptr %118, align 4
  %120 = mul nuw nsw i64 %93, 7
  %121 = add nuw nsw i64 %120, %97
  %122 = getelementptr inbounds nuw float, ptr %69, i64 %121
  %123 = load float, ptr %122, align 4
  %124 = fmul float %113, %119
  %125 = fadd float %123, %124
  %126 = mul nuw nsw i64 %93, 7
  %127 = add nuw nsw i64 %126, %97
  %128 = getelementptr inbounds nuw float, ptr %69, i64 %127
  store float %125, ptr %128, align 4
  %129 = add i64 %105, 1
  br label %104

130:                                              ; preds = %104
  %131 = add i64 %101, 1
  br label %100

132:                                              ; preds = %100
  %133 = add i64 %97, 1
  br label %96

134:                                              ; preds = %96
  %135 = add i64 %93, 1
  br label %92

136:                                              ; preds = %92
  br label %137

137:                                              ; preds = %149, %136
  %138 = phi i64 [ %150, %149 ], [ 0, %136 ]
  %139 = icmp slt i64 %138, 9
  br i1 %139, label %140, label %151

140:                                              ; preds = %137
  br label %141

141:                                              ; preds = %144, %140
  %142 = phi i64 [ %148, %144 ], [ 0, %140 ]
  %143 = icmp slt i64 %142, 9
  br i1 %143, label %144, label %149

144:                                              ; preds = %141
  %145 = mul nuw nsw i64 %138, 9
  %146 = add nuw nsw i64 %145, %142
  %147 = getelementptr inbounds nuw float, ptr %27, i64 %146
  store float 0.000000e+00, ptr %147, align 4
  %148 = add i64 %142, 1
  br label %141

149:                                              ; preds = %141
  %150 = add i64 %138, 1
  br label %137

151:                                              ; preds = %137
  %152 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %22, 0
  %153 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %152, ptr %27, 1
  %154 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %153, i64 10, 2
  %155 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %154, i64 7, 3, 0
  %156 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %155, i64 9, 4, 0
  %157 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %156, i64 7, 3, 1
  %158 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %157, i64 1, 4, 1
  %159 = call ptr @llvm.stacksave.p0()
  %160 = alloca { ptr, ptr, i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %76, ptr %160, align 8
  %161 = insertvalue { i64, ptr } { i64 2, ptr poison }, ptr %160, 1
  %162 = alloca { ptr, ptr, i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %158, ptr %162, align 8
  %163 = insertvalue { i64, ptr } { i64 2, ptr poison }, ptr %162, 1
  %164 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %161, ptr %164, align 8
  %165 = alloca { i64, ptr }, i64 1, align 8
  store { i64, ptr } %163, ptr %165, align 8
  call void @memrefCopy(i64 4, ptr %164, ptr %165)
  call void @llvm.stackrestore.p0(ptr %159)
  call void @free(ptr %64)
  ret { ptr, ptr, i64, [2 x i64], [2 x i64] } %34
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
