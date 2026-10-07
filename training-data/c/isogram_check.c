#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>

bool is_isogram(const char *s) {
    unsigned seen = 0;
    for (; *s; s++) {
        if (!isalpha((unsigned char)*s)) continue;
        unsigned bit = 1u << (tolower((unsigned char)*s) - 'a');
        if (seen & bit) return false;
        seen |= bit;
    }
    return true;
}

int main(void) {
    const char *words[] = {"lumberjacks", "background", "six-year-old", "isograms"};
    for (int i = 0; i < 4; i++) printf("%s %d\n", words[i], is_isogram(words[i]));
    return 0;
}
