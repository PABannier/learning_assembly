# include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 3
#define M 3
#define K 3

void matmul(double[N][M], double[M][K], double[N][K]);

int main() {
    double A[N][M];
    double B[M][K];
    double out[N][K];

    srand(time(NULL));

    for(int i = 0; i < M; i++) {
        for(int j = 0; j < N; j++) {
            A[i][j] = (float)rand() / (float)RAND_MAX;
            B[j][i] = (float)rand() / (float)RAND_MAX;
        }
    }

    matmul(A, B, out);

    for(int i = 0; i < N; i++) {
        for(int j = 0; j < K; j++) {
            printf("%f ", out[i][j]);
        }
        printf("\n");
    }

    return 0;
}
