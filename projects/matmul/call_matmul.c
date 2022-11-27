# include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 20
#define M 20
#define K 20

void matmul(double[N][M], double[M][K], double[N][K], int, int, int);


int main() {
    double A[N][M];
    double B[M][K];
    double out[N][K];
    double truth[N][K];

    srand(time(NULL));

    // initialize A and B
    for(int i = 0; i < M; i++) {
        for(int j = 0; j < N; j++) {
            A[i][j] = (float)rand() / (float)RAND_MAX;
            B[j][i] = (float)rand() / (float)RAND_MAX;
        }
    }

    // print A
    printf("A = \n");
    for(int i = 0; i < M; i++) {
        for(int j = 0; j < N; j++) {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }

    printf("\n");

    printf("B = \n");
    for(int i = 0; i < M; i++) {
        for(int j = 0; j < N; j++) {
            printf("%f ", B[i][j]);
        }
        printf("\n");
    }

    printf("\n");

    matmul(A, B, out, N, M, K);

    printf("out = \n");
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < K; j++) {
            printf("%f ", out[i][j]);
        }
        printf("\n");
    }

    printf("\n");

    // ;;;;;;;;;;;;;;;;;;;;;;;;;
    // truth
    // ;;;;;;;;;;;;;;;;;;;;;;;;;

    for(int i = 0; i < N; i++) {
        for(int k = 0; k < K; k++) {
            double tmp = 0.;
            for(int j = 0; j < M; j++) {
                tmp += A[i][j] * B[j][k];
            }
            truth[i][k] = tmp;
        }
    }

    printf("truth = \n");
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < K; j++) {
            printf("%f ", truth[i][j]);
        }
        printf("\n");
    }

    return 0;
}

