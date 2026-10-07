#include <stdio.h>
#include <string.h>

#define POOL_SIZE 1024

typedef struct Block {
    size_t size;
    int free;
    struct Block *next;
} Block;

static unsigned char pool[POOL_SIZE];
static Block *free_list = NULL;

void allocator_init(void) {
    free_list = (Block *)pool;
    free_list->size = POOL_SIZE - sizeof(Block);
    free_list->free = 1;
    free_list->next = NULL;
}

void *my_alloc(size_t size) {
    Block *cur = free_list;
    while (cur) {
        if (cur->free && cur->size >= size) {
            if (cur->size >= size + sizeof(Block) + 8) {
                Block *split = (Block *)((unsigned char *)cur + sizeof(Block) + size);
                split->size = cur->size - size - sizeof(Block);
                split->free = 1;
                split->next = cur->next;
                cur->next = split;
                cur->size = size;
            }
            cur->free = 0;
            return (unsigned char *)cur + sizeof(Block);
        }
        cur = cur->next;
    }
    return NULL;
}

void my_free(void *ptr) {
    if (!ptr) return;
    Block *block = (Block *)((unsigned char *)ptr - sizeof(Block));
    block->free = 1;

    Block *cur = free_list;
    while (cur && cur->next) {
        if (cur->free && cur->next->free &&
            (unsigned char *)cur + sizeof(Block) + cur->size == (unsigned char *)cur->next) {
            cur->size += sizeof(Block) + cur->next->size;
            cur->next = cur->next->next;
        } else {
            cur = cur->next;
        }
    }
}

void print_blocks(void) {
    int index = 0;
    for (Block *cur = free_list; cur; cur = cur->next, index++) {
        printf("block %d: size=%zu free=%d\n", index, cur->size, cur->free);
    }
}

int main(void) {
    allocator_init();

    void *a = my_alloc(64);
    void *b = my_alloc(128);
    void *c = my_alloc(32);

    strcpy((char *)a, "hello");
    printf("a contains: %s\n", (char *)a);

    print_blocks();

    my_free(b);
    printf("after freeing b:\n");
    print_blocks();

    my_free(a);
    my_free(c);
    printf("after freeing a and c:\n");
    print_blocks();

    return 0;
}
