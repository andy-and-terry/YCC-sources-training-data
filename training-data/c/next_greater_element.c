#include <stdio.h>

void next_greater_elements(int arr[], int n, int result[]) {
    int stack[n];
    int top = -1;

    for (int i = n - 1; i >= 0; i--) {
        while (top >= 0 && stack[top] <= arr[i]) top--;
        result[i] = (top >= 0) ? stack[top] : -1;
        stack[++top] = arr[i];
    }
}

int main(void) {
    int arr[] = {4, 5, 2, 25, 7, 8};
    int n = sizeof(arr) / sizeof(arr[0]);
    int result[n];

    next_greater_elements(arr, n, result);

    for (int i = 0; i < n; i++) printf("%d -> %d\n", arr[i], result[i]);
    return 0;
}
