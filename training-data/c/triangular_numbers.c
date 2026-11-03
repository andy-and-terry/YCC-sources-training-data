#include <stdio.h>

int main(void) {
    int sum = 0;
    for (int n = 1; n <= 10; n++) {
        sum += n;
        printf("%d ", sum);
    }
    printf("\n");
    return 0;
}
