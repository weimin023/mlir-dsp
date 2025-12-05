#include <stdio.h>
#include <stdlib.h>
#include <valgrind/callgrind.h>

// Naive version: allocates a NEW buffer for the result
float* padding1d_naive(float *src, int ori_len, int padded_len) {
    float *result = (float *)malloc(padded_len * sizeof(float));
    for (int i=0; i<padded_len; ++i) {
        if (i < ori_len) {
            result[i] = src[i];
        } else {
            result[i] = 0;
        }
    }
    return result;
}

// Naive version: allocates a NEW buffer for the result
float* elementwise_mul_naive(float *input, float *filter, int len) {
    float *result = (float *)malloc(len * sizeof(float));
    for (int i=0; i<len; ++i) {
        result[i] = input[i] * filter[i];
    }
    return result;
}

int main() {
    int ori_len = 10000;
    int padding_len = 5000;
    int padded_len = ori_len + padding_len;

    CALLGRIND_START_INSTRUMENTATION;

    float *tx_replica = (float *)malloc(ori_len * sizeof(float));
    for (int i=0; i<ori_len; ++i) tx_replica[i] = i;

    float *filter = (float *)malloc(padded_len * sizeof(float));
    for (int i=0; i<padded_len; ++i) filter[i] = 2;
    
    // Naive: each function allocates its own output buffer
    float *tx_replica_padded = padding1d_naive(tx_replica, ori_len, padded_len);
    float *result = elementwise_mul_naive(tx_replica_padded, filter, padded_len);
    
    CALLGRIND_STOP_INSTRUMENTATION;

    free(tx_replica);
    free(filter);
    free(tx_replica_padded);
    free(result);
    return 0;
}
