#include <stdio.h>

void next_greater_elements(int arr[], int n, int result[]) {
    int stack[n];
    int top = -1;

    for (int i = 0; i < n; i++) result[i] = -1;

    for (int i = 0; i < n; i++) {
        while (top >= 0 && arr[stack[top]] < arr[i]) {
            result[stack[top]] = arr[i];
            top--;
        }
        stack[++top] = i;
    }
}

int main(void) {
    int arr[] = {4, 5, 2, 25, 7, 8, 1};
    int n = sizeof(arr) / sizeof(arr[0]);
    int result[n];

    next_greater_elements(arr, n, result);

    for (int i = 0; i < n; i++) {
        printf("%d -> %d\n", arr[i], result[i]);
    }
    return 0;
}
