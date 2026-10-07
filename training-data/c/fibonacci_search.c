#include <stdio.h>

int fibonacci_search(const int *a, int n, int target) {
    int f2 = 0, f1 = 1, f = 1;
    while (f < n) {
        f2 = f1;
        f1 = f;
        f = f1 + f2;
    }
    int offset = -1;
    while (f > 1) {
        int i = offset + f2 < n - 1 ? offset + f2 : n - 1;
        if (a[i] < target) {
            f = f1; f1 = f2; f2 = f - f1; offset = i;
        } else if (a[i] > target) {
            f = f2; f1 = f1 - f2; f2 = f - f1;
        } else {
            return i;
        }
    }
    if (f1 && offset + 1 < n && a[offset + 1] == target) return offset + 1;
    return -1;
}

int main(void) {
    int a[] = {10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100};
    int n = sizeof a / sizeof a[0];
    int targets[] = {85, 10, 100, 7};
    for (int i = 0; i < 4; i++) printf("%d -> %d\n", targets[i], fibonacci_search(a, n, targets[i]));
    return 0;
}
