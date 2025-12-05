valgrind --tool=massif --massif-out-file=massif.0.baseline_naive.%p ./0.baseline_naive
valgrind --tool=massif --massif-out-file=massif.0.baseline.%p ./0.baseline
valgrind --tool=massif --massif-out-file=massif.0.baseline_opt.%p ./0.baseline_opt
valgrind --tool=massif --massif-out-file=massif.1.buffer_reuse.%p ./1.buffer_reuse