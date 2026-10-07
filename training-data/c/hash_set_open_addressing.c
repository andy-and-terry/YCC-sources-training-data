#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char **slots;
    size_t cap, size, used;
} strset;

static char TOMB[] = "";

static size_t fnv1a(const char *s) {
    size_t h = 1469598103934665603ull;
    for (; *s; s++) h = (h ^ (unsigned char)*s) * 1099511628211ull;
    return h;
}

static void set_add(strset *s, const char *key);

static void set_resize(strset *s) {
    char **old = s->slots;
    size_t oldcap = s->cap;
    s->cap = oldcap ? oldcap * 2 : 8;
    s->slots = calloc(s->cap, sizeof *s->slots);
    s->size = s->used = 0;
    for (size_t i = 0; i < oldcap; i++)
        if (old[i] && old[i] != TOMB) {
            set_add(s, old[i]);
            free(old[i]);
        }
    free(old);
}

bool set_contains(const strset *s, const char *key) {
    if (!s->cap) return false;
    for (size_t i = fnv1a(key) % s->cap, n = 0; n < s->cap; i = (i + 1) % s->cap, n++) {
        if (!s->slots[i]) return false;
        if (s->slots[i] != TOMB && strcmp(s->slots[i], key) == 0) return true;
    }
    return false;
}

static void set_add(strset *s, const char *key) {
    if (set_contains(s, key)) return;
    if ((s->used + 1) * 2 > s->cap) set_resize(s);
    size_t i = fnv1a(key) % s->cap;
    while (s->slots[i] && s->slots[i] != TOMB) i = (i + 1) % s->cap;
    if (!s->slots[i]) s->used++;
    s->slots[i] = strdup(key);
    s->size++;
}

bool set_remove(strset *s, const char *key) {
    for (size_t i = fnv1a(key) % s->cap, n = 0; n < s->cap; i = (i + 1) % s->cap, n++) {
        if (!s->slots[i]) return false;
        if (s->slots[i] != TOMB && strcmp(s->slots[i], key) == 0) {
            free(s->slots[i]);
            s->slots[i] = TOMB;
            s->size--;
            return true;
        }
    }
    return false;
}

int main(void) {
    strset s = {0};
    char text[] = "the quick brown fox jumps over the lazy dog";
    for (char *w = strtok(text, " "); w; w = strtok(NULL, " ")) set_add(&s, w);
    set_remove(&s, "fox");
    printf("size=%zu fox=%d dog=%d\n", s.size, set_contains(&s, "fox"), set_contains(&s, "dog"));
    for (size_t i = 0; i < s.cap; i++)
        if (s.slots[i] && s.slots[i] != TOMB) free(s.slots[i]);
    free(s.slots);
    return 0;
}
