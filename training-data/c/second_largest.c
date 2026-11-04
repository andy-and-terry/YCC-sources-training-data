#include <limits.h>
#include <stdio.h>

int main(void) {
    int xs[] = {4, 9, 2, 9, 7};
    int first = INT_MIN, second = INT_MIN;
    for (int i = 0; i < 5; i++) {
        if (xs[i] > first) { second = first; first = xs[i]; }
        else if (xs[i] < first && xs[i] > second) second = xs[i];
    }
    printf("%d\n", second);
    return 0;
}
