module {
    func.func @add(%0: i32, %1: i32)->i32 {
        %c = arith.addi %0, %1: i32
        return %c: i32
    }

    func.func @sub(%0: i32, %1: i32)->i32 {
        %c = arith.subi %0, %1: i32
        return %c: i32
    }

    func.func @mul(%0: i32, %1: i32)->i32 {
        %c = arith.muli %0, %1: i32
        return %c: i32
    }

    func.func @my_div(%0: i32, %1: i32)->i32 {
        %c = arith.divsi %0, %1: i32
        return %c: i32
    }
}