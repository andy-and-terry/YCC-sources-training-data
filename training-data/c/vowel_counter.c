#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void) {
    const char *s = "Education is beautiful";
    const char *vowels = "aeiou";
    int counts[5] = {0};
    for (; *s; s++) {
        const char *p = strchr(vowels, tolower((unsigned char)*s));
        if (p && *p) counts[p - vowels]++;
    }
    for (int i = 0; i < 5; i++) printf("%c=%d ", vowels[i], counts[i]);
    printf("\n");
    return 0;
}
