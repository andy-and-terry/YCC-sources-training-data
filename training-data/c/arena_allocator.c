#include <stdio.h>
#include <stdlib.h>

typedef struct {
    unsigned char *buffer;
    size_t capacity;
    size_t offset;
} Arena;

void arena_init(Arena *arena, size_t capacity) {
    arena->buffer = malloc(capacity);
    arena->capacity = capacity;
    arena->offset = 0;
}

void *arena_alloc(Arena *arena, size_t size) {
    size_t aligned = (size + 7) & ~((size_t)7);
    if (arena->offset + aligned > arena->capacity) return NULL;
    void *ptr = arena->buffer + arena->offset;
    arena->offset += aligned;
    return ptr;
}

void arena_reset(Arena *arena) {
    arena->offset = 0;
}

void arena_destroy(Arena *arena) {
    free(arena->buffer);
    arena->buffer = NULL;
    arena->capacity = 0;
    arena->offset = 0;
}

int main(void) {
    Arena arena;
    arena_init(&arena, 256);

    int *a = arena_alloc(&arena, sizeof(int));
    int *b = arena_alloc(&arena, sizeof(int));
    double *c = arena_alloc(&arena, sizeof(double));

    *a = 10;
    *b = 20;
    *c = 3.14;

    printf("a=%d b=%d c=%.2f used=%zu/%zu\n", *a, *b, *c, arena.offset, arena.capacity);

    arena_reset(&arena);
    printf("after reset used=%zu/%zu\n", arena.offset, arena.capacity);

    arena_destroy(&arena);
    return 0;
}
