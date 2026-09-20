#include <stdio.h>

void sliding_window_max(int arr[], int n, int k, int result[]) {
    int deque[n];
    int front = 0, back = -1;
    int result_count = 0;

    for (int i = 0; i < n; i++) {
        while (front <= back && deque[front] <= i - k) front++;
        while (front <= back && arr[deque[back]] <= arr[i]) back--;
        deque[++back] = i;
        if (i >= k - 1) result[result_count++] = arr[deque[front]];
    }
}

int main(void) {
    int arr[] = {1, 3, -1, -3, 5, 3, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    int k = 3;
    int result[n - k + 1];

    sliding_window_max(arr, n, k, result);

    for (int i = 0; i < n - k + 1; i++) printf("%d ", result[i]);
    printf("\n");
    return 0;
}
