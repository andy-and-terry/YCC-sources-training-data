#include <stdio.h>
#include <string.h>

#define RANGE 100

void counting_sort(int arr[], int n) {
    int count[RANGE] = {0};
    int output[n];

    for (int i = 0; i < n; i++) count[arr[i]]++;
    for (int i = 1; i < RANGE; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) {
        output[count[arr[i]] - 1] = arr[i];
        count[arr[i]]--;
    }
    memcpy(arr, output, n * sizeof(int));
}

int main(void) {
    int arr[] = {4, 2, 2, 8, 3, 3, 1, 0};
    int n = sizeof(arr) / sizeof(arr[0]);

    counting_sort(arr, n);

    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
