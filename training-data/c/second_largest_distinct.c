#include <limits.h>
#include <stdio.h>

int main(void) {
    int v[] = {5, 3, 9, 9, 1};
    int n = sizeof v / sizeof v[0];
    int first = INT_MIN, second = INT_MIN;
    for (int i = 0; i < n; i++) {
        if (v[i] > first) {
            second = first;
            first = v[i];
        } else if (v[i] > second && v[i] < first) {
            second = v[i];
        }
    }
    printf("%d\n", second);
    return 0;
}
