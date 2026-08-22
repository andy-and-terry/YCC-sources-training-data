#include <stdio.h>

int binary_search(int arr[], int n, int target) {
    int low = 0, high = n - 1;
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}

int main(void) {
    int sorted[] = {1, 3, 5, 7, 9, 11, 13};
    int n = sizeof(sorted) / sizeof(sorted[0]);
    printf("%d\n", binary_search(sorted, n, 7));
    printf("%d\n", binary_search(sorted, n, 4));
    return 0;
}
