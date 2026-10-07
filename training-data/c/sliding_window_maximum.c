#include <stdio.h>

/* Deque of indices, kept in decreasing order of arr[index]. */
void sliding_window_max(int arr[], int n, int k, int result[]) {
    int deque[n];
    int front = 0, back = 0; /* [front, back) */
    int r = 0;

    for (int i = 0; i < n; i++) {
        while (back > front && arr[deque[back - 1]] <= arr[i]) back--;
        deque[back++] = i;

        if (deque[front] <= i - k) front++;

        if (i >= k - 1) result[r++] = arr[deque[front]];
    }
}

int main(void) {
    int arr[] = {1, 3, -1, -3, 5, 3, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    int k = 3;
    int result[n];

    sliding_window_max(arr, n, k, result);

    for (int i = 0; i < n - k + 1; i++) printf("%d ", result[i]);
    printf("\n");
    return 0;
}
