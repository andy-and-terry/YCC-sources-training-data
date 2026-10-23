#include <stdio.h>

#define COUNT 20

int main(void) {
    int seq[COUNT + 3] = {1, 2, 2};
    int len = 3;
    for (int i = 2; len < COUNT; i++) {
        int value = (seq[len - 1] == 2) ? 1 : 2;
        for (int k = 0; k < seq[i]; k++) seq[len++] = value;
    }
    for (int i = 0; i < COUNT; i++) printf("%d ", seq[i]);
    printf("\n");
    return 0;
}
