#include <ctype.h>
#include <stdio.h>
#include <string.h>

typedef struct {
    const char *key, *value;
} var_t;

static const char *lookup(const var_t *vars, size_t n, const char *key, size_t klen) {
    for (size_t i = 0; i < n; i++)
        if (strlen(vars[i].key) == klen && strncmp(vars[i].key, key, klen) == 0) return vars[i].value;
    return "";
}

/* Replaces {{ name }} and {{ name|upper }} placeholders. */
void render(const char *tpl, const var_t *vars, size_t n, FILE *out) {
    for (const char *p = tpl; *p;) {
        const char *open = strstr(p, "{{");
        if (!open) {
            fputs(p, out);
            break;
        }
        fwrite(p, 1, (size_t)(open - p), out);
        const char *close = strstr(open, "}}");
        if (!close) {
            fputs(open, out);
            break;
        }
        const char *k = open + 2;
        while (*k == ' ') k++;
        const char *ke = k;
        while (isalnum((unsigned char)*ke) || *ke == '_') ke++;
        const char *filter = memchr(ke, '|', (size_t)(close - ke));
        const char *v = lookup(vars, n, k, (size_t)(ke - k));
        int upper = filter && strncmp(filter + 1 + strspn(filter + 1, " "), "upper", 5) == 0;
        for (; *v; v++) fputc(upper ? toupper((unsigned char)*v) : *v, out);
        p = close + 2;
    }
}

int main(void) {
    var_t vars[] = {{"name", "Ada"}, {"count", "3"}, {"kind", "messages"}};
    render("Hello {{ name }}, you have {{count}} new {{ kind | upper }}.\n", vars, 3, stdout);
    return 0;
}
