#include <stdio.h>
#include <stdlib.h>
int main(void) {
    const char *s = getenv("COUNT");
    int n = s ? atoi(s) : 3;
    printf("n=%d\n", n);
    return 0;
}
