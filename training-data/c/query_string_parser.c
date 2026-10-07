#include <ctype.h>
#include <stdio.h>
#include <string.h>

static int hexval(char c) {
    if (isdigit((unsigned char)c)) return c - '0';
    c = (char)tolower((unsigned char)c);
    return (c >= 'a' && c <= 'f') ? c - 'a' + 10 : -1;
}

/* Decodes %XX and '+' in place; returns the new length. */
size_t url_decode(char *s) {
    char *w = s;
    for (char *r = s; *r; r++) {
        if (*r == '+') *w++ = ' ';
        else if (*r == '%' && hexval(r[1]) >= 0 && hexval(r[2]) >= 0) {
            *w++ = (char)(hexval(r[1]) * 16 + hexval(r[2]));
            r += 2;
        } else *w++ = *r;
    }
    *w = '\0';
    return (size_t)(w - s);
}

int main(void) {
    char qs[] = "name=J%C3%BCrgen+M&tag=a&tag=b&empty=&flag";
    char *save = NULL;
    for (char *pair = strtok_r(qs, "&", &save); pair; pair = strtok_r(NULL, "&", &save)) {
        char *eq = strchr(pair, '=');
        char empty[1] = "";
        char *val = empty;
        if (eq) {
            *eq = '\0';
            val = eq + 1;
        }
        url_decode(pair);
        url_decode(val);
        printf("%-6s = \"%s\"\n", pair, val);
    }
    return 0;
}
