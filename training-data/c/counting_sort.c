#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void counting_sort(int *arr, int n) {
    if (n == 0) return;

    int max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] > max) max = arr[i];
    }

    int *counts = calloc((size_t)max + 1, sizeof(int));
    for (int i = 0; i < n; i++) {
        counts[arr[i]]++;
    }
    for (int i = 1; i <= max; i++) {
        counts[i] += counts[i - 1];
    }

    int *output = malloc((size_t)n * sizeof(int));
    for (int i = n - 1; i >= 0; i--) {
        output[--counts[arr[i]]] = arr[i];
    }

    memcpy(arr, output, (size_t)n * sizeof(int));
    free(counts);
    free(output);
}

int main(void) {
    int arr[] = {4, 2, 2, 8, 3, 3, 1, 0};
    int n = sizeof(arr) / sizeof(arr[0]);

    counting_sort(arr, n);

    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    return 0;
}
