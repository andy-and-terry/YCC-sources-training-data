#include <stdio.h>
#include <string.h>

void run_length_encode(const char *src, char *dest) {
    int n = strlen(src);
    int d = 0;
    for (int i = 0; i < n; ) {
        char c = src[i];
        int count = 0;
        while (i < n && src[i] == c) {
            count++;
            i++;
        }
        d += sprintf(dest + d, "%d%c", count, c);
    }
    dest[d] = '\0';
}

int main(void) {
    char encoded[64];
    run_length_encode("aaabbbcca", encoded);
    printf("%s\n", encoded);
    run_length_encode("wwwwaaadexxxxxx", encoded);
    printf("%s\n", encoded);
    return 0;
}
