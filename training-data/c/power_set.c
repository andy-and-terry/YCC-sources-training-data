#include <stdio.h>

void print_power_set(int arr[], int n) {
    int subsets = 1 << n;
    for (int mask = 0; mask < subsets; mask++) {
        printf("{ ");
        for (int i = 0; i < n; i++) {
            if (mask & (1 << i)) {
                printf("%d ", arr[i]);
            }
        }
        printf("}\n");
    }
}

int main(void) {
    int arr[] = {1, 2, 3};
    print_power_set(arr, 3);
    return 0;
}
