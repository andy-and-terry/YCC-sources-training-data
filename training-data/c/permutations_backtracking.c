#include <stdio.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void print_array(int arr[], int n) {
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
}

void permute(int arr[], int start, int n) {
    if (start == n) {
        print_array(arr, n);
        return;
    }
    for (int i = start; i < n; i++) {
        swap(&arr[start], &arr[i]);
        permute(arr, start + 1, n);
        swap(&arr[start], &arr[i]);
    }
}

int main(void) {
    int arr[] = {1, 2, 3};
    permute(arr, 0, 3);
    return 0;
}
