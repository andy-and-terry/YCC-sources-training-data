#include <stdio.h>
#include <string.h>

void justify(const char **words, int n, int width) {
    int i = 0;
    while (i < n) {
        int j = i, len = 0;
        while (j < n && len + (int)strlen(words[j]) + (j - i) <= width) len += (int)strlen(words[j++]);
        int gaps = j - i - 1;
        putchar('[');
        if (j == n || gaps == 0) {
            int col = 0;
            for (int k = i; k < j; k++) col += printf("%s%s", k > i ? " " : "", words[k]);
            printf("%*s", width - col, "");
        } else {
            int spaces = (width - len) / gaps, extra = (width - len) % gaps;
            for (int k = i; k < j - 1; k++) printf("%s%*s", words[k], spaces + (k - i < extra ? 1 : 0), "");
            printf("%s", words[j - 1]);
        }
        printf("]\n");
        i = j;
    }
}

int main(void) {
    const char *words[] = {"This", "is", "an", "example", "of", "text", "justification", "done", "greedily", "line", "by", "line"};
    justify(words, (int)(sizeof words / sizeof *words), 20);
    return 0;
}
