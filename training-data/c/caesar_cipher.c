#include <ctype.h>
#include <stdio.h>

static void caesar(char *s, int shift) {
    shift = ((shift % 26) + 26) % 26;
    for (; *s; s++) {
        if (isupper((unsigned char)*s))
            *s = 'A' + (*s - 'A' + shift) % 26;
        else if (islower((unsigned char)*s))
            *s = 'a' + (*s - 'a' + shift) % 26;
    }
}

int main(void) {
    char text[] = "Hello, World!";
    caesar(text, 3);
    printf("encrypted: %s\n", text);
    caesar(text, -3);
    printf("decrypted: %s\n", text);
    return 0;
}
