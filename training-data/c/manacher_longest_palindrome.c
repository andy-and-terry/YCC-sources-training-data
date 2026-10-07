#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TRANSFORMED 512

void transform(const char *s, char *t) {
    int i = 0;
    t[i++] = '^';
    for (int j = 0; s[j]; j++) {
        t[i++] = '#';
        t[i++] = s[j];
    }
    t[i++] = '#';
    t[i++] = '$';
    t[i] = '\0';
}

void longest_palindrome(const char *s, char *result) {
    char t[MAX_TRANSFORMED];
    transform(s, t);
    int n = (int)strlen(t);

    int p[MAX_TRANSFORMED] = {0};
    int center = 0, right = 0;

    for (int i = 1; i < n - 1; i++) {
        if (i < right) {
            int mirror = 2 * center - i;
            p[i] = (right - i < p[mirror]) ? right - i : p[mirror];
        }
        while (t[i + p[i] + 1] == t[i - p[i] - 1]) p[i]++;
        if (i + p[i] > right) {
            center = i;
            right = i + p[i];
        }
    }

    int max_len = 0, center_index = 0;
    for (int i = 1; i < n - 1; i++) {
        if (p[i] > max_len) {
            max_len = p[i];
            center_index = i;
        }
    }

    int start = (center_index - max_len) / 2;
    memcpy(result, s + start, max_len);
    result[max_len] = '\0';
}

int main(void) {
    const char *inputs[] = {"babad", "cbbd", "forgeeksskeegfor"};
    for (int i = 0; i < 3; i++) {
        char result[MAX_TRANSFORMED];
        longest_palindrome(inputs[i], result);
        printf("%s -> %s\n", inputs[i], result);
    }
    return 0;
}
