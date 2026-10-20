#include <stdio.h>

int main(void) {
    unsigned long long row[32] = {1}, next[32];
    int len = 1;
    printf("%llu ", row[0]);
    for (int n = 1; n < 12; n++) {
        next[0] = row[len - 1];
        for (int i = 0; i < len; i++) next[i + 1] = next[i] + row[i];
        len++;
        for (int i = 0; i < len; i++) row[i] = next[i];
        printf("%llu ", row[0]);
    }
    printf("\n");
    return 0;
}
