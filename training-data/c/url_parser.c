#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char scheme[16], host[128], path[256], query[256], fragment[64];
    int port;
} url_t;

static void copy_span(char *dst, size_t cap, const char *from, const char *to) {
    size_t n = (size_t)(to - from);
    if (n >= cap) n = cap - 1;
    memcpy(dst, from, n);
    dst[n] = '\0';
}

int parse_url(const char *s, url_t *u) {
    memset(u, 0, sizeof *u);
    const char *p = strstr(s, "://");
    if (!p) return -1;
    copy_span(u->scheme, sizeof u->scheme, s, p);
    const char *host = p + 3;
    const char *at = strpbrk(host, "@/?#");
    if (at && *at == '@') host = at + 1;
    const char *end = host + strcspn(host, ":/?#");
    copy_span(u->host, sizeof u->host, host, end);
    u->port = strcmp(u->scheme, "https") == 0 ? 443 : strcmp(u->scheme, "http") == 0 ? 80 : -1;
    if (*end == ':') {
        u->port = (int)strtol(end + 1, (char **)&end, 10);
    }
    const char *q = end + strcspn(end, "?#");
    copy_span(u->path, sizeof u->path, end, q);
    if (!u->path[0]) strcpy(u->path, "/");
    if (*q == '?') {
        const char *h = q + 1 + strcspn(q + 1, "#");
        copy_span(u->query, sizeof u->query, q + 1, h);
        q = h;
    }
    if (*q == '#') copy_span(u->fragment, sizeof u->fragment, q + 1, q + strlen(q));
    return 0;
}

int main(void) {
    const char *tests[] = {"https://user:pw@example.com:8443/a/b?x=1&y=2#top", "http://localhost", "ftp://files.example.org/pub/"};
    for (int i = 0; i < 3; i++) {
        url_t u;
        if (parse_url(tests[i], &u) == 0)
            printf("scheme=%s host=%s port=%d path=%s query=%s fragment=%s\n", u.scheme, u.host, u.port, u.path, u.query, u.fragment);
    }
    return 0;
}
