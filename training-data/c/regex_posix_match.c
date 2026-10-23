#include <regex.h>
#include <stdio.h>

/* Match a string against a POSIX extended regex and print capture groups. */
static void try_match(const regex_t *re, const char *text) {
    regmatch_t m[4];
    if (regexec(re, text, 4, m, 0) != 0) {
        printf("%-12s no match\n", text);
        return;
    }
    printf("%-12s year=%.*s month=%.*s day=%.*s\n", text,
           (int)(m[1].rm_eo - m[1].rm_so), text + m[1].rm_so,
           (int)(m[2].rm_eo - m[2].rm_so), text + m[2].rm_so,
           (int)(m[3].rm_eo - m[3].rm_so), text + m[3].rm_so);
}

int main(void) {
    regex_t re;
    int rc = regcomp(&re, "^([0-9]{4})-([0-9]{2})-([0-9]{2})$", REG_EXTENDED);
    if (rc != 0) {
        char buf[128];
        regerror(rc, &re, buf, sizeof buf);
        fprintf(stderr, "regcomp: %s\n", buf);
        return 1;
    }
    try_match(&re, "2024-03-15");
    try_match(&re, "2024-3-15");
    try_match(&re, "1999-12-31");
    regfree(&re);
    return 0;
}
