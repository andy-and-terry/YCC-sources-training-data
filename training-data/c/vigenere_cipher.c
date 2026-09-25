#include <ctype.h>
#include <stdio.h>
#include <string.h>

void vigenere(char *text, const char *key, int dir) {
    size_t klen = strlen(key), k = 0;
    for (char *p = text; *p; p++) {
        if (!isalpha((unsigned char)*p)) continue;
        char base = isupper((unsigned char)*p) ? 'A' : 'a';
        int s = tolower((unsigned char)key[k++ % klen]) - 'a';
        *p = (char)(base + ((*p - base + dir * s) % 26 + 26) % 26);
    }
}

int main(void) {
    char msg[] = "Attack at dawn!";
    vigenere(msg, "LEMON", 1);
    printf("%s -> ", msg);
    vigenere(msg, "LEMON", -1);
    printf("%s\n", msg);
    return 0;
}
