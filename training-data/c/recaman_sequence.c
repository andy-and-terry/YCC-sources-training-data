#include <stdio.h>
#include <stdbool.h>

#define COUNT 20
#define MAXV 1000

int main(void) {
    int seq[COUNT] = {0};
    static bool seen[MAXV];
    seen[0] = true;
    for (int n = 1; n < COUNT; n++) {
        int next = seq[n - 1] - n;
        if (next < 0 || seen[next]) next = seq[n - 1] + n;
        seq[n] = next;
        seen[next] = true;
    }
    for (int i = 0; i < COUNT; i++) printf("%d ", seq[i]);
    printf("\n");
    return 0;
}
