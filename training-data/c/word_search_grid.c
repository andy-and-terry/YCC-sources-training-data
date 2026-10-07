#include <stdbool.h>
#include <stdio.h>

#define R 3
#define C 4

static bool dfs(char b[R][C + 1], const char *w, int r, int c) {
    if (!*w) return true;
    if (r < 0 || r >= R || c < 0 || c >= C || b[r][c] != *w) return false;
    char tmp = b[r][c];
    b[r][c] = '#';
    bool found = dfs(b, w + 1, r + 1, c) || dfs(b, w + 1, r - 1, c) || dfs(b, w + 1, r, c + 1) || dfs(b, w + 1, r, c - 1);
    b[r][c] = tmp;
    return found;
}

bool exists(char b[R][C + 1], const char *word) {
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++)
            if (dfs(b, word, r, c)) return true;
    return false;
}

int main(void) {
    char b[R][C + 1] = {"ABCE", "SFCS", "ADEE"};
    const char *words[] = {"ABCCED", "SEE", "ABCB"};
    for (int i = 0; i < 3; i++) printf("%s %s\n", words[i], exists(b, words[i]) ? "true" : "false");
    return 0;
}
