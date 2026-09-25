#include <stdio.h>
#include <string.h>

static const char *KEYS[] = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};

/* Odometer-style iteration over all combinations without recursion. */
int letter_combinations(const char *digits, int print) {
    size_t len = strlen(digits);
    if (len == 0 || len > 16) return 0;
    int n = (int)len, idx[16] = {0}, total = 0;
    char out[17];
    for (;;) {
        for (int i = 0; i < n; i++) out[i] = KEYS[digits[i] - '0'][idx[i]];
        out[n] = '\0';
        if (print) printf("%s ", out);
        total++;
        int k = n - 1;
        while (k >= 0 && ++idx[k] == (int)strlen(KEYS[digits[k] - '0'])) idx[k--] = 0;
        if (k < 0) break;
    }
    if (print) printf("\n");
    return total;
}

int main(void) {
    letter_combinations("23", 1);
    printf("7979 -> %d combinations\n", letter_combinations("7979", 0));
    return 0;
}
