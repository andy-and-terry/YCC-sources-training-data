#include <stdio.h>

void swap(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int arr[], int low, int high) {
    int pivot = arr[high];
    int i = low;
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            swap(&arr[i], &arr[j]);
            i++;
        }
    }
    swap(&arr[i], &arr[high]);
    return i;
}

int quickselect(int arr[], int low, int high, int k) {
    if (low == high) return arr[low];
    int pivot_index = partition(arr, low, high);
    if (k == pivot_index) return arr[k];
    else if (k < pivot_index) return quickselect(arr, low, pivot_index - 1, k);
    else return quickselect(arr, pivot_index + 1, high, k);
}

int main(void) {
    int arr[] = {7, 10, 4, 3, 20, 15};
    int n = sizeof(arr) / sizeof(arr[0]);
    printf("%d\n", quickselect(arr, 0, n - 1, 2));
    return 0;
}
