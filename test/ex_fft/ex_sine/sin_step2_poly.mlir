module {
  func.func @sin_gpu(%arg0: f32) -> f32 {
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %cst = arith.constant -2.59630184E-7 : f32
    %cst_0 = arith.constant 2.47562348E-5 : f32
    %cst_1 = arith.constant -0.00138883304 : f32
    %cst_2 = arith.constant 0.0416666418 : f32
    %cst_3 = arith.constant -5.000000e-01 : f32
    %cst_4 = arith.constant -2.50293279E-8 : f32
    %cst_5 = arith.constant 2.76001265E-6 : f32
    %cst_6 = arith.constant -1.98426045E-4 : f32
    %cst_7 = arith.constant 0.00833334774 : f32
    %cst_8 = arith.constant -0.166666672 : f32
    %cst_9 = arith.constant -1.000000e+00 : f32
    %cst_10 = arith.constant 1.000000e+00 : f32
    %cst_11 = arith.constant 0.636619746 : f32
    %cst_12 = arith.constant 1.57079637 : f32
    %0 = arith.mulf %arg0, %cst_11 : f32
    %1 = math.floor %0 : f32
    %2 = arith.mulf %1, %cst_12 : f32
    %3 = arith.subf %arg0, %2 : f32
    %4 = arith.fptosi %1 : f32 to i32
    %5 = arith.andi %4, %c3_i32 : i32
    %6 = arith.cmpi eq, %5, %c1_i32 : i32
    %7 = arith.cmpi eq, %5, %c3_i32 : i32
    %8 = arith.ori %6, %7 : i1
    %9 = arith.cmpi sgt, %5, %c1_i32 : i32
    %10 = arith.mulf %3, %3 : f32
    %11 = arith.select %8, %cst_10, %3 : f32
    %12 = arith.select %8, %cst_3, %cst_8 : f32
    %13 = arith.select %8, %cst_2, %cst_7 : f32
    %14 = arith.select %8, %cst_1, %cst_6 : f32
    %15 = arith.select %8, %cst_0, %cst_5 : f32
    %16 = arith.select %8, %cst, %cst_4 : f32
    %17 = math.fma %10, %16, %15 : f32
    %18 = math.fma %10, %17, %14 : f32
    %19 = math.fma %10, %18, %13 : f32
    %20 = math.fma %10, %19, %12 : f32
    %21 = math.fma %10, %20, %cst_10 : f32
    %22 = arith.mulf %11, %21 : f32
    %23 = arith.mulf %22, %cst_9 : f32
    %24 = arith.select %9, %23, %22 : f32
    return %24 : f32
  }
}

