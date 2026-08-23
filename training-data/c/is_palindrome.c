#include <stdio.h>
#include <string.h>

int is_palindrome(const char *s) {
    int len = strlen(s);
    for (int i = 0; i < len / 2; i++) {
        if (s[i] != s[len - 1 - i]) return 0;
    }
    return 1;
}

int main(void) {
    printf("%d\n", is_palindrome("racecar"));
    printf("%d\n", is_palindrome("hello"));
    return 0;
}
