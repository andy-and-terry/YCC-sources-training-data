#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct TrieNode {
    struct TrieNode *children[26];
    int is_end;
} TrieNode;

TrieNode *create_node(void) {
    TrieNode *node = calloc(1, sizeof(TrieNode));
    return node;
}

void insert(TrieNode *root, const char *word) {
    TrieNode *node = root;
    for (int i = 0; word[i]; i++) {
        int idx = word[i] - 'a';
        if (!node->children[idx]) node->children[idx] = create_node();
        node = node->children[idx];
    }
    node->is_end = 1;
}

int search(TrieNode *root, const char *word) {
    TrieNode *node = root;
    for (int i = 0; word[i]; i++) {
        int idx = word[i] - 'a';
        if (!node->children[idx]) return 0;
        node = node->children[idx];
    }
    return node->is_end;
}

int main(void) {
    TrieNode *root = create_node();
    insert(root, "cat");
    insert(root, "car");
    insert(root, "card");
    printf("%d\n", search(root, "car"));
    printf("%d\n", search(root, "ca"));
    return 0;
}
