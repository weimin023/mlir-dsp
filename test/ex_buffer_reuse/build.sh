g++ ex_main.cpp mlir_runtime.cpp toLLVM.o -o 1.buffer_reuse
gcc baseline_opt.cpp -o 0.baseline_opt
gcc baseline.cpp -O0 -o 0.baseline
gcc baseline_naive.cpp -O0 -o 0.baseline_naive