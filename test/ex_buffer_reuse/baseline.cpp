#include <stdio.h>
#include <stdlib.h>
#include <valgrind/callgrind.h>

void padding1d(float **dest_ptr, float **src_ptr, int ori_len, int padded_len) {
    for (int i=0;i<padded_len;++i) {
        if (i < ori_len) {
            (*dest_ptr)[i] = (*src_ptr)[i];
        } else {
            (*dest_ptr)[i] = 0;
        }
    }
}

void elementwise_mul(float **dest_ptr, float **filter_ptr, int len) {
    for (int i=0; i<len; ++i) {
        (*dest_ptr)[i] *= (*filter_ptr)[i];
    }
}

int main() {
    int ori_len = 10000;
    int padding_len = 5000;
    int padded_len = ori_len + padding_len;

    CALLGRIND_START_INSTRUMENTATION;

    float *tx_replica = (float *)malloc(ori_len * sizeof(float));
    for (int i=0;i<ori_len;++i) tx_replica[i] = i;

    float *filter = (float *)malloc(padded_len * sizeof(float));
    for (int i=0; i<padded_len; ++i) filter[i] = 2;
    
    float *tx_replica_padded = (float *)malloc(padded_len * sizeof(float));

    padding1d(&tx_replica_padded, &tx_replica, ori_len, padded_len);
    elementwise_mul(&tx_replica_padded, &filter, padded_len);
    
    CALLGRIND_STOP_INSTRUMENTATION;

    free(tx_replica);
    free(filter);
    free(tx_replica_padded);
    return 0;
}