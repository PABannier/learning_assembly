#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N_COLS 3
#define N_ROWS 3

void matmul(double[][] a, double[][] b, double [][] out);

int main() {
    double A[N_ROWS][N_COLS];
    double B[N_COLS][N_ROWS];
    double out[N_ROWS][N_ROWS];

    srand(time(NULL));

    for(int i = 0; i < N_ROWS; i++) {
        for(int j = 0; j < N_COLS; j++) {
            A[i][j] = (float)rand() / (float)RAND_MAX;
            B[j][i] = (float)rand() / (float)RAND_MAX;
        }
    }

    matmul(A, B, out);

    for(int i = 0; i < N_ROWS; i++) {
        for(int j = 0; j < N_ROWS; j++) {
            printf("%d ", out[i][j]);
        }
        printf("\n");
    }


}
