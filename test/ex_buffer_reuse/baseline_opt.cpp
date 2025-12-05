#include <stdio.h>
#include <stdlib.h>
#include <valgrind/callgrind.h>

void dynamic_padding_and_add(float **data_ptr, int len, int pad_len) {
    float *original_data = *data_ptr;
    int new_len = len + pad_len;

    float *padded = (float *)malloc(new_len * sizeof(float));

    for (int i=0;i<new_len;++i) {
        if (i < len) padded[i] = original_data[i];
        else padded[i] = 0;
    }

    for (int i=0;i<new_len;++i) {
        padded[i] += 2;
    }

    *data_ptr = padded;
}

int main() {
    int initial_len = 10000;
    int padding_amount = 5000;
    
    float *data = (float *)malloc(initial_len * sizeof(float));
    if (data == NULL) return 1;

    for (int i=0;i<initial_len;++i) data[i] = i;
    
    CALLGRIND_START_INSTRUMENTATION;
    dynamic_padding_and_add(&data, initial_len, padding_amount);
    CALLGRIND_STOP_INSTRUMENTATION;

    free(data);
    
    return 0;
}