module {
    func.func @naive_gemm(%src_a: memref<?x?xf16>, %src_b: memref<?x?xf16>, %dst_c: memref<?x?xf32>) {
        %c0 = arith.constant 0 : index
        %c1 = arith.constant 1 : index
        %M = memref.dim %src_a, %c0 : memref<?x?xf16>
        %N = memref.dim %src_b, %c1 : memref<?x?xf16>
        %K = memref.dim %src_a, %c1 : memref<?x?xf16>

        affine.for %i = 0 to %M {
            affine.for %j = 0 to %N {
                affine.for %k = 0 to %K {
                    %a = affine.load %src_a[%i, %k] : memref<?x?xf16>
                    %b = affine.load %src_b[%k, %j] : memref<?x?xf16>
                    %c = affine.load %dst_c[%i, %j] : memref<?x?xf32>

                    %a_ext = arith.extf %a : f16 to f32
                    %b_ext = arith.extf %b : f16 to f32

                    %prod = arith.mulf %a_ext, %b_ext : f32
                    %sum = arith.addf %c, %prod : f32
                    affine.store %sum, %dst_c[%i, %j] : memref<?x?xf32>
                }
            }
        }
        func.return
    }
}