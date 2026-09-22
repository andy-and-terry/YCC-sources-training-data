#include <stdio.h>

/* Monotonic-stack solution: for each element, the next element to its
   right that is strictly greater, or -1 if none exists. */
void next_greater(const int arr[], int n, int result[]) {
    int stack[64];
    int top = -1;

    for (int i = n - 1; i >= 0; i--) {
        while (top >= 0 && stack[top] <= arr[i]) top--;
        result[i] = (top >= 0) ? stack[top] : -1;
        stack[++top] = arr[i];
    }
}

int main(void) {
    int arr[] = {4, 5, 2, 25, 7, 8};
    int n = (int)(sizeof(arr) / sizeof(arr[0]));
    int result[64];

    next_greater(arr, n, result);

    for (int i = 0; i < n; i++) {
        printf("%d -> %d\n", arr[i], result[i]);
    }
    return 0;
}
