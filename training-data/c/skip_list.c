#include <stdio.h>
#include <stdlib.h>

#define MAX_LEVEL 4
#define PROBABILITY 2

typedef struct SkipNode {
    int value;
    struct SkipNode *forward[MAX_LEVEL + 1];
} SkipNode;

typedef struct {
    SkipNode *header;
    int level;
} SkipList;

SkipNode *make_node(int value, int level) {
    SkipNode *node = malloc(sizeof(SkipNode));
    node->value = value;
    for (int i = 0; i <= level; i++) node->forward[i] = NULL;
    return node;
}

void skiplist_init(SkipList *list) {
    list->level = 0;
    list->header = make_node(-1, MAX_LEVEL);
}

int random_level(void) {
    int level = 0;
    while (rand() % PROBABILITY == 0 && level < MAX_LEVEL) level++;
    return level;
}

void skiplist_insert(SkipList *list, int value) {
    SkipNode *update[MAX_LEVEL + 1];
    SkipNode *cur = list->header;

    for (int i = list->level; i >= 0; i--) {
        while (cur->forward[i] && cur->forward[i]->value < value) cur = cur->forward[i];
        update[i] = cur;
    }

    int level = random_level();
    if (level > list->level) {
        for (int i = list->level + 1; i <= level; i++) update[i] = list->header;
        list->level = level;
    }

    SkipNode *node = make_node(value, level);
    for (int i = 0; i <= level; i++) {
        node->forward[i] = update[i]->forward[i];
        update[i]->forward[i] = node;
    }
}

int skiplist_search(SkipList *list, int value) {
    SkipNode *cur = list->header;
    for (int i = list->level; i >= 0; i--) {
        while (cur->forward[i] && cur->forward[i]->value < value) cur = cur->forward[i];
    }
    cur = cur->forward[0];
    return cur && cur->value == value;
}

void skiplist_free(SkipList *list) {
    SkipNode *cur = list->header;
    while (cur) {
        SkipNode *next = cur->forward[0];
        free(cur);
        cur = next;
    }
}

int main(void) {
    srand(42);
    SkipList list;
    skiplist_init(&list);

    int values[] = {3, 6, 7, 9, 12, 19, 17};
    int n = sizeof(values) / sizeof(values[0]);
    for (int i = 0; i < n; i++) skiplist_insert(&list, values[i]);

    int queries[] = {19, 15, 3, 100};
    for (int i = 0; i < 4; i++) {
        printf("%d -> %s\n", queries[i], skiplist_search(&list, queries[i]) ? "found" : "missing");
    }

    skiplist_free(&list);
    return 0;
}
