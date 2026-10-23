#include <stdio.h>

int main(void) {
    FILE *p = popen("echo alpha; echo beta; echo gamma", "r");
    if (!p) return 1;
    char line[64];
    int n = 0;
    while (fgets(line, sizeof line, p)) {
        n++;
        printf("%d: %s", n, line);
    }
    int status = pclose(p);
    printf("lines=%d status=%d\n", n, status);
    return 0;
}
