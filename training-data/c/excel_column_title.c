#include <stdio.h>

static void column_title(int n, char *out) {
    char tmp[16];
    int k = 0;
    while (n > 0) {
        n--;
        tmp[k++] = 'A' + n % 26;
        n /= 26;
    }
    for (int i = 0; i < k; i++) out[i] = tmp[k - 1 - i];
    out[k] = '\0';
}

int main(void) {
    char s[16];
    column_title(28, s);
    printf("%s ", s);
    column_title(701, s);
    printf("%s\n", s); /* AB ZY */
    return 0;
}
