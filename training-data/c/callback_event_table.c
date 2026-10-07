#include <stdio.h>
#include <string.h>

typedef void (*Handler)(const char *arg);

typedef struct {
    const char *name;
    Handler handler;
} Command;

static void on_hello(const char *arg) { printf("hello, %s!\n", arg); }
static void on_shout(const char *arg) {
    for (const char *p = arg; *p; p++) putchar((*p >= 'a' && *p <= 'z') ? *p - 32 : *p);
    putchar('\n');
}
static void on_count(const char *arg) { printf("%zu characters\n", strlen(arg)); }

static const Command table[] = {
    {"hello", on_hello},
    {"shout", on_shout},
    {"count", on_count},
};

static void dispatch(const char *name, const char *arg) {
    for (size_t i = 0; i < sizeof(table) / sizeof(table[0]); i++) {
        if (strcmp(table[i].name, name) == 0) {
            table[i].handler(arg);
            return;
        }
    }
    printf("unknown command: %s\n", name);
}

int main(void) {
    dispatch("hello", "world");
    dispatch("shout", "quiet words");
    dispatch("count", "twelve chars");
    dispatch("nope", "x");
    return 0;
}
