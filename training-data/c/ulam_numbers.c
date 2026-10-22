#include <stdio.h>

#define COUNT 15

int main(void) {
    int seq[COUNT] = {1, 2};
    int len = 2;
    for (int n = 3; len < COUNT; n++) {
        int ways = 0;
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j < len; j++) {
                if (seq[i] + seq[j] == n) ways++;
            }
        }
        if (ways == 1) seq[len++] = n;
    }
    for (int i = 0; i < COUNT; i++) printf("%d ", seq[i]);
    printf("\n");
    return 0;
}
