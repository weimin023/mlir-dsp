; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @add(i32 %0, i32 %1) {
  %3 = add i32 %0, %1
  ret i32 %3
}

define i32 @sub(i32 %0, i32 %1) {
  %3 = sub i32 %0, %1
  ret i32 %3
}

define i32 @mul(i32 %0, i32 %1) {
  %3 = mul i32 %0, %1
  ret i32 %3
}

define i32 @my_div(i32 %0, i32 %1) {
  %3 = sdiv i32 %0, %1
  ret i32 %3
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
