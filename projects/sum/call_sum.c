#include <stdio.h>
#include <inttypes.h>


double sum(double[], uint64_t);

int main() {
    double test[] = {
        40.5, 26.7, -3.23, -34.4
    };
    printf("%20.7f\n", sum(test, 4));

    return 0;
}
