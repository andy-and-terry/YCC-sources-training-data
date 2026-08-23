#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(void) {
    char text[] = "the quick brown fox jumps over the lazy dog the fox runs";
    char words[20][20];
    int counts[20] = {0};
    int n = 0;

    char *token = strtok(text, " ");
    while (token) {
        int found = 0;
        for (int i = 0; i < n; i++) {
            if (strcmp(words[i], token) == 0) {
                counts[i]++;
                found = 1;
                break;
            }
        }
        if (!found) {
            strcpy(words[n], token);
            counts[n] = 1;
            n++;
        }
        token = strtok(NULL, " ");
    }

    for (int i = 0; i < n; i++) {
        printf("%s: %d\n", words[i], counts[i]);
    }
    return 0;
}
