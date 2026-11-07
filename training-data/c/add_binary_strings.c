#include <stdio.h>
#include <string.h>

static void add_binary(const char *a, const char *b, char *out) {
    int i = (int)strlen(a) - 1, j = (int)strlen(b) - 1, carry = 0, k = 0;
    char tmp[64];
    while (i >= 0 || j >= 0 || carry) {
        int sum = carry;
        if (i >= 0) sum += a[i--] - '0';
        if (j >= 0) sum += b[j--] - '0';
        tmp[k++] = '0' + sum % 2;
        carry = sum / 2;
    }
    for (int x = 0; x < k; x++) out[x] = tmp[k - 1 - x];
    out[k] = '\0';
}

int main(void) {
    char out[64];
    add_binary("1010", "1011", out);
    puts(out); /* 10101 */
    return 0;
}
