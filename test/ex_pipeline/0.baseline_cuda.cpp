#include <stdlib.h>
#include <stdio.h>

// 原始輸入大小: 5x5
#define INPUT_SIZE 5
// T1 (Conv Input) 大小: 5 + 2*2 = 9
#define CONV_INPUT_SIZE 9
// T2 (Conv Output) 大小: (9 - 3)/1 + 1 = 7
#define T2_SIZE 7
// Output 大小: 7 + 2*1 = 9
#define OUTPUT_SIZE 9
#define KERNEL_SIZE 3
#define GET_INDEX(row, col, num_cols) ((row) * (num_cols) + (col))

// 將 input (R x C) 填充 PADDING_SIZE 後，寫入 output ((R+2P) x (C+2P))
void apply_padding(float* input, int input_rows, int input_cols, 
                   float* output, int output_rows, int output_cols, 
                   int padding_size) {
    
    // 初始化輸出陣列為 0 
    for (int i = 0; i < output_rows * output_cols; i++) {
        output[i] = 0.0f;
    }

    // 複製輸入影像到中心區域
    for (int i = 0; i < input_rows; i++) {
        for (int j = 0; j < input_cols; j++) {
            
            // 輸出座標: [i + padding_size][j + padding_size]
            int out_r = i + padding_size;
            int out_c = j + padding_size;
            
            // 進行索引轉換
            int input_idx = GET_INDEX(i, j, input_cols);
            int output_idx = GET_INDEX(out_r, out_c, output_cols);
            
            output[output_idx] = input[input_idx];
        }
    }
}

// Conv (Input, W) -> Output
void apply_convolution(float* input, int input_rows, int input_cols, 
                       float* kernel, int kernel_size, 
                       float* output, int output_rows, int output_cols) {
    
    // 假設 Stride = 1
    int stride = 1;
    
    for (int i = 0; i < output_rows; i++) {
        for (int j = 0; j < output_cols; j++) {
            float sum = 0.0f;
            
            // 掃描卷積核區域
            for (int kr = 0; kr < kernel_size; kr++) {
                for (int kc = 0; kc < kernel_size; kc++) {
                    
                    // 輸入座標: [i * stride + kr][j * stride + kc]
                    int in_r = i * stride + kr;
                    int in_c = j * stride + kc;
                    
                    // 索引轉換
                    int input_idx = GET_INDEX(in_r, in_c, input_cols);
                    int kernel_idx = GET_INDEX(kr, kc, kernel_size);
                    
                    sum += input[input_idx] * kernel[kernel_idx];
                }
            }
            
            int output_idx = GET_INDEX(i, j, output_cols);
            output[output_idx] = sum;
        }
    }
}

int main() {
    float *Input = (float *)malloc(INPUT_SIZE*INPUT_SIZE*sizeof(float));
    for (int i=0;i<INPUT_SIZE*INPUT_SIZE;++i) {
        Input[i] = (float)i;
    }
        
    #define KERNEL_SUM 16.0f
    float Kernel[KERNEL_SIZE*KERNEL_SIZE] = {
        1.0f / KERNEL_SUM, 2.0f / KERNEL_SUM, 1.0f / KERNEL_SUM,
        2.0f / KERNEL_SUM, 4.0f / KERNEL_SUM, 2.0f / KERNEL_SUM,
        1.0f / KERNEL_SUM, 2.0f / KERNEL_SUM, 1.0f / KERNEL_SUM
    };

    // 1. Padding (I (5x5) -> T1 (9x9)) 
    // P = (9 - 5) / 2 = 2
    float *T1 = (float*)malloc(CONV_INPUT_SIZE*CONV_INPUT_SIZE*sizeof(float));
    apply_padding(Input, INPUT_SIZE, INPUT_SIZE, T1, CONV_INPUT_SIZE, CONV_INPUT_SIZE, 2);
    free(Input);
    // T1 live (9x9)

    // 2. Convolution (T1 (9x9) -> T2 (7x7)) 
    // Output = (9 - 3) / 1 + 1 = 7
    float *T2 = (float*)malloc(T2_SIZE*T2_SIZE*sizeof(float));
    apply_convolution(T1, CONV_INPUT_SIZE, CONV_INPUT_SIZE, Kernel, KERNEL_SIZE, 
                      T2, T2_SIZE, T2_SIZE);
    free(T1);
    // T2 live (7x7)

    // 3. Padding (T2 (7x7) -> Output (9x9)) 
    // P = (9 - 7) / 2 = 1
    float *Output = (float*)malloc(OUTPUT_SIZE*OUTPUT_SIZE*sizeof(float));
    apply_padding(T2, T2_SIZE, T2_SIZE, Output, OUTPUT_SIZE, OUTPUT_SIZE, 1);
    free(T2);
    // Output live (9x9)
    
    // 釋放記憶體
    free(Output);

    return 0;
}