module attributes {gpu.container_module} {
  func.func @tosa_fft(%arg0: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x1x8xf32>, memref<1x1x8xf32>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 8.000000e+00 : f32
    %cst_0 = arith.constant 6.28318548 : f32
    %c8 = arith.constant 8 : index
    %cst_1 = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    gpu.launch_func  @tosa_fft_kernel::@tosa_fft_kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%c0 : index, %c0 : index, %cst_1 : f32, %alloc : memref<1x1x8xf32>)
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<1x1x8xf32>
    gpu.launch_func  @tosa_fft_kernel_0::@tosa_fft_kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%c0 : index, %c0 : index, %cst_1 : f32, %alloc_2 : memref<1x1x8xf32>)
    gpu.launch_func  @tosa_fft_kernel_1::@tosa_fft_kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%c0 : index, %c0 : index, %arg0 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg1 : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %alloc : memref<1x1x8xf32>, %alloc_2 : memref<1x1x8xf32>, %c8 : index, %cst : f32, %cst_1 : f32, %cst_0 : f32)
    return %alloc, %alloc_2 : memref<1x1x8xf32>, memref<1x1x8xf32>
  }
  gpu.module @tosa_fft_kernel {
    gpu.func @tosa_fft_kernel(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<1x1x8xf32>) kernel {
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id  x
      %thread_id_x = gpu.thread_id  x
      %0 = arith.addi %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %thread_id_x : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%2: index):  // 2 preds: ^bb0, ^bb11
      %3 = arith.cmpi slt, %2, %c8 : index
      cf.cond_br %3, ^bb2, ^bb12
    ^bb2:  // pred: ^bb1
      %4 = arith.addi %0, %c1 : index
      cf.br ^bb3(%0 : index)
    ^bb3(%5: index):  // 2 preds: ^bb2, ^bb10
      %6 = arith.cmpi slt, %5, %4 : index
      cf.cond_br %6, ^bb4, ^bb11
    ^bb4:  // pred: ^bb3
      %7 = arith.addi %1, %c1 : index
      cf.br ^bb5(%1 : index)
    ^bb5(%8: index):  // 2 preds: ^bb4, ^bb9
      %9 = arith.cmpi slt, %8, %7 : index
      cf.cond_br %9, ^bb6, ^bb10
    ^bb6:  // pred: ^bb5
      %10 = arith.addi %2, %c1 : index
      cf.br ^bb7(%2 : index)
    ^bb7(%11: index):  // 2 preds: ^bb6, ^bb8
      %12 = arith.cmpi slt, %11, %10 : index
      cf.cond_br %12, ^bb8, ^bb9
    ^bb8:  // pred: ^bb7
      memref.store %arg2, %arg3[%5, %8, %11] : memref<1x1x8xf32>
      %13 = arith.addi %11, %c1 : index
      cf.br ^bb7(%13 : index)
    ^bb9:  // pred: ^bb7
      %14 = arith.addi %8, %c1 : index
      cf.br ^bb5(%14 : index)
    ^bb10:  // pred: ^bb5
      %15 = arith.addi %5, %c1 : index
      cf.br ^bb3(%15 : index)
    ^bb11:  // pred: ^bb3
      %16 = arith.addi %2, %c1 : index
      cf.br ^bb1(%16 : index)
    ^bb12:  // pred: ^bb1
      gpu.return
    }
  }
  gpu.module @tosa_fft_kernel_0 {
    gpu.func @tosa_fft_kernel(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<1x1x8xf32>) kernel {
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id  x
      %thread_id_x = gpu.thread_id  x
      %0 = arith.addi %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %thread_id_x : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%2: index):  // 2 preds: ^bb0, ^bb11
      %3 = arith.cmpi slt, %2, %c8 : index
      cf.cond_br %3, ^bb2, ^bb12
    ^bb2:  // pred: ^bb1
      %4 = arith.addi %0, %c1 : index
      cf.br ^bb3(%0 : index)
    ^bb3(%5: index):  // 2 preds: ^bb2, ^bb10
      %6 = arith.cmpi slt, %5, %4 : index
      cf.cond_br %6, ^bb4, ^bb11
    ^bb4:  // pred: ^bb3
      %7 = arith.addi %1, %c1 : index
      cf.br ^bb5(%1 : index)
    ^bb5(%8: index):  // 2 preds: ^bb4, ^bb9
      %9 = arith.cmpi slt, %8, %7 : index
      cf.cond_br %9, ^bb6, ^bb10
    ^bb6:  // pred: ^bb5
      %10 = arith.addi %2, %c1 : index
      cf.br ^bb7(%2 : index)
    ^bb7(%11: index):  // 2 preds: ^bb6, ^bb8
      %12 = arith.cmpi slt, %11, %10 : index
      cf.cond_br %12, ^bb8, ^bb9
    ^bb8:  // pred: ^bb7
      memref.store %arg2, %arg3[%5, %8, %11] : memref<1x1x8xf32>
      %13 = arith.addi %11, %c1 : index
      cf.br ^bb7(%13 : index)
    ^bb9:  // pred: ^bb7
      %14 = arith.addi %8, %c1 : index
      cf.br ^bb5(%14 : index)
    ^bb10:  // pred: ^bb5
      %15 = arith.addi %5, %c1 : index
      cf.br ^bb3(%15 : index)
    ^bb11:  // pred: ^bb3
      %16 = arith.addi %2, %c1 : index
      cf.br ^bb1(%16 : index)
    ^bb12:  // pred: ^bb1
      gpu.return
    }
  }
  gpu.module @tosa_fft_kernel_1 {
    gpu.func @tosa_fft_kernel(%arg0: index, %arg1: index, %arg2: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg3: memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>, %arg4: memref<1x1x8xf32>, %arg5: memref<1x1x8xf32>, %arg6: index, %arg7: f32, %arg8: f32, %arg9: f32) kernel {
      %c2_i32 = arith.constant 2 : i32
      %c1_i32 = arith.constant 1 : i32
      %c0_i32 = arith.constant 0 : i32
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
      %cst_11 = arith.constant 1.57079637 : f32
      %cst_12 = arith.constant 0.636619746 : f32
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id  x
      %thread_id_x = gpu.thread_id  x
      %0 = arith.addi %arg0, %block_id_x : index
      %1 = arith.addi %arg1, %thread_id_x : index
      cf.br ^bb1(%c0 : index)
    ^bb1(%2: index):  // 2 preds: ^bb0, ^bb23
      %3 = arith.cmpi slt, %2, %c8 : index
      cf.cond_br %3, ^bb2, ^bb24
    ^bb2:  // pred: ^bb1
      cf.br ^bb3(%c0 : index)
    ^bb3(%4: index):  // 2 preds: ^bb2, ^bb22
      %5 = arith.cmpi slt, %4, %c1 : index
      cf.cond_br %5, ^bb4, ^bb23
    ^bb4:  // pred: ^bb3
      cf.br ^bb5(%c0 : index)
    ^bb5(%6: index):  // 2 preds: ^bb4, ^bb21
      %7 = arith.cmpi slt, %6, %c8 : index
      cf.cond_br %7, ^bb6, ^bb22
    ^bb6:  // pred: ^bb5
      %8 = arith.addi %0, %c1 : index
      cf.br ^bb7(%0 : index)
    ^bb7(%9: index):  // 2 preds: ^bb6, ^bb20
      %10 = arith.cmpi slt, %9, %8 : index
      cf.cond_br %10, ^bb8, ^bb21
    ^bb8:  // pred: ^bb7
      %11 = arith.addi %1, %c1 : index
      cf.br ^bb9(%1 : index)
    ^bb9(%12: index):  // 2 preds: ^bb8, ^bb19
      %13 = arith.cmpi slt, %12, %11 : index
      cf.cond_br %13, ^bb10, ^bb20
    ^bb10:  // pred: ^bb9
      %14 = arith.addi %2, %c1 : index
      cf.br ^bb11(%2 : index)
    ^bb11(%15: index):  // 2 preds: ^bb10, ^bb18
      %16 = arith.cmpi slt, %15, %14 : index
      cf.cond_br %16, ^bb12, ^bb19
    ^bb12:  // pred: ^bb11
      %17 = arith.addi %4, %c1 : index
      cf.br ^bb13(%4 : index)
    ^bb13(%18: index):  // 2 preds: ^bb12, ^bb17
      %19 = arith.cmpi slt, %18, %17 : index
      cf.cond_br %19, ^bb14, ^bb18
    ^bb14:  // pred: ^bb13
      %20 = arith.addi %6, %c1 : index
      cf.br ^bb15(%6 : index)
    ^bb15(%21: index):  // 2 preds: ^bb14, ^bb16
      %22 = arith.cmpi slt, %21, %20 : index
      cf.cond_br %22, ^bb16, ^bb17
    ^bb16:  // pred: ^bb15
      %23 = memref.load %arg2[%9, %18, %21] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
      %24 = memref.load %arg3[%9, %18, %21] : memref<1x1x8xf32, strided<[?, ?, ?], offset: ?>>
      %25 = memref.load %arg4[%9, %12, %15] : memref<1x1x8xf32>
      %26 = memref.load %arg5[%9, %12, %15] : memref<1x1x8xf32>
      %27 = index.mul %21, %15
      %28 = index.remu %27, %arg6
      %29 = arith.index_castui %28 : index to i32
      %30 = arith.uitofp %29 : i32 to f32
      %31 = arith.divf %30, %arg7 : f32
      %32 = arith.addf %31, %arg8 : f32
      %33 = arith.mulf %32, %arg9 : f32
      %34 = arith.mulf %33, %cst_12 : f32
      %35 = math.floor %34 : f32
      %36 = arith.mulf %35, %cst_11 : f32
      %37 = arith.subf %33, %36 : f32
      %38 = arith.fptosi %35 : f32 to i32
      %39 = arith.andi %38, %c3_i32 : i32
      %40 = arith.cmpi eq, %39, %c0_i32 : i32
      %41 = arith.cmpi eq, %39, %c1_i32 : i32
      %42 = arith.cmpi eq, %39, %c2_i32 : i32
      %43 = arith.ori %40, %42 : i1
      %44 = arith.ori %41, %42 : i1
      %45 = arith.mulf %37, %37 : f32
      %46 = arith.select %43, %cst_10, %37 : f32
      %47 = arith.select %43, %cst_3, %cst_8 : f32
      %48 = arith.select %43, %cst_2, %cst_7 : f32
      %49 = arith.select %43, %cst_1, %cst_6 : f32
      %50 = arith.select %43, %cst_0, %cst_5 : f32
      %51 = arith.select %43, %cst, %cst_4 : f32
      %52 = math.fma %45, %51, %50 : f32
      %53 = math.fma %45, %52, %49 : f32
      %54 = math.fma %45, %53, %48 : f32
      %55 = math.fma %45, %54, %47 : f32
      %56 = math.fma %45, %55, %cst_10 : f32
      %57 = arith.mulf %46, %56 : f32
      %58 = arith.mulf %57, %cst_9 : f32
      %59 = arith.select %44, %58, %57 : f32
      %60 = arith.mulf %33, %cst_12 : f32
      %61 = math.floor %60 : f32
      %62 = arith.mulf %61, %cst_11 : f32
      %63 = arith.subf %33, %62 : f32
      %64 = arith.fptosi %61 : f32 to i32
      %65 = arith.andi %64, %c3_i32 : i32
      %66 = arith.cmpi eq, %65, %c1_i32 : i32
      %67 = arith.cmpi eq, %65, %c3_i32 : i32
      %68 = arith.ori %66, %67 : i1
      %69 = arith.cmpi sgt, %65, %c1_i32 : i32
      %70 = arith.mulf %63, %63 : f32
      %71 = arith.select %68, %cst_10, %63 : f32
      %72 = arith.select %68, %cst_3, %cst_8 : f32
      %73 = arith.select %68, %cst_2, %cst_7 : f32
      %74 = arith.select %68, %cst_1, %cst_6 : f32
      %75 = arith.select %68, %cst_0, %cst_5 : f32
      %76 = arith.select %68, %cst, %cst_4 : f32
      %77 = math.fma %70, %76, %75 : f32
      %78 = math.fma %70, %77, %74 : f32
      %79 = math.fma %70, %78, %73 : f32
      %80 = math.fma %70, %79, %72 : f32
      %81 = math.fma %70, %80, %cst_10 : f32
      %82 = arith.mulf %71, %81 : f32
      %83 = arith.mulf %82, %cst_9 : f32
      %84 = arith.select %69, %83, %82 : f32
      %85 = arith.mulf %23, %59 : f32
      %86 = arith.mulf %24, %84 : f32
      %87 = arith.addf %85, %86 : f32
      %88 = arith.mulf %24, %59 : f32
      %89 = arith.mulf %23, %84 : f32
      %90 = arith.subf %88, %89 : f32
      %91 = arith.addf %25, %87 : f32
      %92 = arith.addf %26, %90 : f32
      memref.store %91, %arg4[%9, %12, %15] : memref<1x1x8xf32>
      memref.store %92, %arg5[%9, %12, %15] : memref<1x1x8xf32>
      %93 = arith.addi %21, %c1 : index
      cf.br ^bb15(%93 : index)
    ^bb17:  // pred: ^bb15
      %94 = arith.addi %18, %c1 : index
      cf.br ^bb13(%94 : index)
    ^bb18:  // pred: ^bb13
      %95 = arith.addi %15, %c1 : index
      cf.br ^bb11(%95 : index)
    ^bb19:  // pred: ^bb11
      %96 = arith.addi %12, %c1 : index
      cf.br ^bb9(%96 : index)
    ^bb20:  // pred: ^bb9
      %97 = arith.addi %9, %c1 : index
      cf.br ^bb7(%97 : index)
    ^bb21:  // pred: ^bb7
      %98 = arith.addi %6, %c1 : index
      cf.br ^bb5(%98 : index)
    ^bb22:  // pred: ^bb5
      %99 = arith.addi %4, %c1 : index
      cf.br ^bb3(%99 : index)
    ^bb23:  // pred: ^bb3
      %100 = arith.addi %2, %c1 : index
      cf.br ^bb1(%100 : index)
    ^bb24:  // pred: ^bb1
      gpu.return
    }
  }
}

