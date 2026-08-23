#include <stdio.h>

int count_vowels(const char *s) {
    int count = 0;
    for (int i = 0; s[i]; i++) {
        char c = s[i];
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') count++;
    }
    return count;
}

int main(void) {
    printf("%d\n", count_vowels("hello world"));
    return 0;
}
