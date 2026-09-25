#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>

bool is_pangram(const char *s) {
    unsigned mask = 0;
    for (; *s; s++)
        if (isalpha((unsigned char)*s)) mask |= 1u << (tolower((unsigned char)*s) - 'a');
    return mask == (1u << 26) - 1;
}

int main(void) {
    printf("%d\n", is_pangram("The quick brown fox jumps over the lazy dog"));
    printf("%d\n", is_pangram("Hello world"));
    return 0;
}
