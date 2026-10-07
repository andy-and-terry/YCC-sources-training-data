#include <stdbool.h>
#include <stdio.h>

bool can_jump(const int *a, int n) {
    int reach = 0;
    for (int i = 0; i < n && i <= reach; i++)
        if (i + a[i] > reach) reach = i + a[i];
    return reach >= n - 1;
}

int min_jumps(const int *a, int n) {
    int jumps = 0, end = 0, far = 0;
    for (int i = 0; i < n - 1; i++) {
        if (i + a[i] > far) far = i + a[i];
        if (i == end) {
            if (far <= i) return -1;
            jumps++;
            end = far;
        }
    }
    return jumps;
}

int main(void) {
    int a[] = {2, 3, 1, 1, 4}, b[] = {3, 2, 1, 0, 4};
    printf("%d %d | %d %d\n", can_jump(a, 5), can_jump(b, 5), min_jumps(a, 5), min_jumps(b, 5));
    return 0;
}
