#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int compare_chars(const void *a, const void *b) {
    return *(const char *)a - *(const char *)b;
}

void sorted_key(const char *word, char *out) {
    strcpy(out, word);
    qsort(out, strlen(out), sizeof(char), compare_chars);
}

int main(void) {
    const char *words[] = {"eat", "tea", "tan", "ate", "nat", "bat"};
    int n = 6;
    char keys[6][16];

    for (int i = 0; i < n; i++) {
        sorted_key(words[i], keys[i]);
    }

    for (int i = 0; i < n; i++) {
        if (keys[i][0] == '\0') continue;
        printf("%s", words[i]);
        for (int j = i + 1; j < n; j++) {
            if (strcmp(keys[i], keys[j]) == 0) {
                printf(" %s", words[j]);
                keys[j][0] = '\0';
            }
        }
        printf("\n");
    }
    return 0;
}
