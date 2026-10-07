#include <ctype.h>
#include <stdio.h>
#include <string.h>

typedef enum { T_NUMBER, T_IDENT, T_KEYWORD, T_STRING, T_OP, T_EOF, T_ERROR } tok_kind;
static const char *KIND_NAMES[] = {"NUMBER", "IDENT", "KEYWORD", "STRING", "OP", "EOF", "ERROR"};

typedef struct {
    tok_kind kind;
    const char *start;
    int len, line;
} token;

typedef struct {
    const char *p;
    int line;
} lexer;

static int is_keyword(const char *s, int len) {
    static const char *kw[] = {"int", "if", "else", "while", "return", "for"};
    for (size_t i = 0; i < sizeof kw / sizeof *kw; i++)
        if ((int)strlen(kw[i]) == len && strncmp(kw[i], s, (size_t)len) == 0) return 1;
    return 0;
}

token next_token(lexer *lx) {
    for (;;) {
        while (*lx->p == ' ' || *lx->p == '\t' || *lx->p == '\n') {
            if (*lx->p == '\n') lx->line++;
            lx->p++;
        }
        if (lx->p[0] == '/' && lx->p[1] == '/') {
            while (*lx->p && *lx->p != '\n') lx->p++;
            continue;
        }
        break;
    }
    token t = {T_EOF, lx->p, 0, lx->line};
    const char *s = lx->p;
    if (!*s) return t;
    if (isdigit((unsigned char)*s)) {
        while (isdigit((unsigned char)*lx->p) || *lx->p == '.') lx->p++;
        t.kind = T_NUMBER;
    } else if (isalpha((unsigned char)*s) || *s == '_') {
        while (isalnum((unsigned char)*lx->p) || *lx->p == '_') lx->p++;
        t.kind = is_keyword(s, (int)(lx->p - s)) ? T_KEYWORD : T_IDENT;
    } else if (*s == '"') {
        lx->p++;
        while (*lx->p && *lx->p != '"') lx->p += (*lx->p == '\\' && lx->p[1]) ? 2 : 1;
        if (*lx->p == '"') lx->p++;
        t.kind = T_STRING;
    } else if (strchr("+-*/=<>!(){};,", *s)) {
        lx->p += (s[1] == '=' && strchr("=<>!", *s)) ? 2 : 1;
        t.kind = T_OP;
    } else {
        lx->p++;
        t.kind = T_ERROR;
    }
    t.len = (int)(lx->p - s);
    return t;
}

int main(void) {
    lexer lx = {"int x = 3.5 * (y + 2); // note\nif (x >= 10) { puts(\"big\"); }", 1};
    for (token t = next_token(&lx); t.kind != T_EOF; t = next_token(&lx))
        printf("%d %-8s %.*s\n", t.line, KIND_NAMES[t.kind], t.len, t.start);
    return 0;
}
