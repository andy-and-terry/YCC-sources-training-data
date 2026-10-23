#include <stdio.h>

#define COUNT 15

int main(void) {
    int terms[COUNT] = {1, 2};
    int len = 2;
    for (int cand = 3; len < COUNT; cand++) {
        int ways = 0;
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j < len; j++) {
                if (terms[i] + terms[j] == cand) ways++;
            }
        }
        if (ways == 1) terms[len++] = cand;
    }
    for (int i = 0; i < COUNT; i++) printf("%d ", terms[i]);
    printf("\n");
    return 0;
}
