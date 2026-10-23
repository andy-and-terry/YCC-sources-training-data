#include <stdio.h>

#define COUNT 20

int main(void) {
    int seq[COUNT] = {0};
    for (int i = 0; i < COUNT - 1; i++) {
        int next = 0;
        for (int j = i - 1; j >= 0; j--) {
            if (seq[j] == seq[i]) {
                next = i - j;
                break;
            }
        }
        seq[i + 1] = next;
    }
    for (int i = 0; i < COUNT; i++) printf("%d ", seq[i]);
    printf("\n");
    return 0;
}
