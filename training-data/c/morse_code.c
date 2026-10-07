#include <ctype.h>
#include <stdio.h>
#include <string.h>

static const char *CODES[36] = {
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..",
    "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-",
    "-.--", "--..", "-----", ".----", "..---", "...--", "....-", ".....", "-....", "--...", "---..", "----.",
};

static const char *encode_char(char c) {
    c = (char)toupper((unsigned char)c);
    if (c >= 'A' && c <= 'Z') return CODES[c - 'A'];
    if (c >= '0' && c <= '9') return CODES[26 + c - '0'];
    return NULL;
}

static char decode_symbol(const char *sym) {
    for (int i = 0; i < 36; i++)
        if (strcmp(CODES[i], sym) == 0) return (char)(i < 26 ? 'A' + i : '0' + i - 26);
    return '?';
}

void decode(const char *code) {
    char sym[8];
    size_t k = 0;
    for (const char *p = code;; p++) {
        if (*p == '.' || *p == '-') {
            if (k < sizeof sym - 1) sym[k++] = *p;
            continue;
        }
        if (k) {
            sym[k] = '\0';
            putchar(decode_symbol(sym));
            k = 0;
        }
        if (*p == '/') putchar(' ');
        if (!*p) break;
    }
    putchar('\n');
}

int main(void) {
    const char *msg = "SOS help 2024";
    char out[256] = "";
    for (const char *p = msg; *p; p++) {
        if (*p == ' ') {
            strcat(out, "/ ");
            continue;
        }
        const char *c = encode_char(*p);
        if (c) {
            strcat(out, c);
            strcat(out, " ");
        }
    }
    printf("%s\n", out);
    decode(out);
    return 0;
}
