#include <stdbool.h>
#include <string.h>
#include <stdio.h>

bool in_dict(const char *word, const char *dict[], int dict_size) {
    for (int i = 0; i < dict_size; i++) {
        if (strcmp(word, dict[i]) == 0) return true;
    }
    return false;
}

bool word_break(const char *s, const char *dict[], int dict_size) {
    int n = strlen(s);
    bool dp[n + 1];
    dp[0] = true;
    for (int i = 1; i <= n; i++) dp[i] = false;

    for (int i = 1; i <= n; i++) {
        for (int j = 0; j < i; j++) {
            if (!dp[j]) continue;
            char sub[n + 1];
            int len = i - j;
            strncpy(sub, s + j, len);
            sub[len] = '\0';
            if (in_dict(sub, dict, dict_size)) {
                dp[i] = true;
                break;
            }
        }
    }
    return dp[n];
}

int main(void) {
    const char *dict[] = {"leet", "code", "sand", "and", "cat", "cats", "dog"};
    int dict_size = sizeof(dict) / sizeof(dict[0]);

    printf("'leetcode' breakable: %s\n", word_break("leetcode", dict, dict_size) ? "true" : "false");
    printf("'sandog' breakable: %s\n", word_break("sandog", dict, dict_size) ? "true" : "false");
    printf("'catsdog' breakable: %s\n", word_break("catsdog", dict, dict_size) ? "true" : "false");
    printf("'catsflag' breakable: %s\n", word_break("catsflag", dict, dict_size) ? "true" : "false");
    return 0;
}
