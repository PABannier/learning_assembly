#include <stdio.h>
#include <inttypes.h>

#define ARRAY_LENGTH 6


void mergesort(double[], uint64_t length);


int main() {
    // double arr[] = {
    //     34.2, -3.1, 45.6, 0.33, -392.3, 3.4
    // };

    double arr[] = {
        -3.2, 4.8
    };

    for(int i = 0; i < ARRAY_LENGTH; i++) {
        printf("%2d\n", arr[i]);
    }

    mergesort(arr, ARRAY_LENGTH);
    print("Array sorted!\n");

    for(int i = 0; i < ARRAY_LENGTH; i++) {
        printf("%2d\n", arr[i]);
    }

    return 0;
}
