#include <stdio.h>

int main(void) {
    int data[] = {5, 3, 8, 1, 9, 2};
    int n = sizeof(data) / sizeof(data[0]);
    int sum = 0, min = data[0], max = data[0];
    for (int i = 0; i < n; i++) {
        sum += data[i];
        if (data[i] < min) min = data[i];
        if (data[i] > max) max = data[i];
    }
    printf("sum: %d\n", sum);
    printf("min: %d\n", min);
    printf("max: %d\n", max);
    printf("avg: %.2f\n", (double)sum / n);
    return 0;
}
