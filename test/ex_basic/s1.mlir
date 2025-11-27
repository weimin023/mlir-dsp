module {
  llvm.func @add(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.add %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @sub(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.sub %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @mul(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.mul %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
  llvm.func @my_div(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.sdiv %arg0, %arg1 : i32
    llvm.return %0 : i32
  }
}

