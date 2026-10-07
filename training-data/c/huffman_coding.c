#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SYMBOLS 26
#define MAX_CODE_LEN 32

typedef struct HuffNode {
    char symbol;
    int freq;
    struct HuffNode *left, *right;
} HuffNode;

HuffNode *pool[MAX_SYMBOLS];
int pool_size = 0;

HuffNode *make_leaf(char symbol, int freq) {
    HuffNode *node = malloc(sizeof(HuffNode));
    node->symbol = symbol;
    node->freq = freq;
    node->left = node->right = NULL;
    return node;
}

HuffNode *make_internal(HuffNode *left, HuffNode *right) {
    HuffNode *node = malloc(sizeof(HuffNode));
    node->symbol = '\0';
    node->freq = left->freq + right->freq;
    node->left = left;
    node->right = right;
    return node;
}

int extract_min(void) {
    int min_index = 0;
    for (int i = 1; i < pool_size; i++) {
        if (pool[i]->freq < pool[min_index]->freq) min_index = i;
    }
    return min_index;
}

HuffNode *build_tree(void) {
    while (pool_size > 1) {
        int i = extract_min();
        HuffNode *first = pool[i];
        pool[i] = pool[--pool_size];

        int j = extract_min();
        HuffNode *second = pool[j];
        pool[j] = pool[--pool_size];

        pool[pool_size++] = make_internal(first, second);
    }
    return pool[0];
}

void print_codes(HuffNode *node, char *code, int depth) {
    if (!node->left && !node->right) {
        code[depth] = '\0';
        printf("%c: %s\n", node->symbol, code);
        return;
    }
    if (node->left) {
        code[depth] = '0';
        print_codes(node->left, code, depth + 1);
    }
    if (node->right) {
        code[depth] = '1';
        print_codes(node->right, code, depth + 1);
    }
}

void free_tree(HuffNode *node) {
    if (!node) return;
    free_tree(node->left);
    free_tree(node->right);
    free(node);
}

int main(void) {
    char symbols[] = {'a', 'b', 'c', 'd', 'e'};
    int freqs[] = {45, 13, 12, 16, 9};
    int count = sizeof(symbols) / sizeof(symbols[0]);

    for (int i = 0; i < count; i++) pool[pool_size++] = make_leaf(symbols[i], freqs[i]);

    HuffNode *root = build_tree();

    char code[MAX_CODE_LEN];
    print_codes(root, code, 0);

    free_tree(root);
    return 0;
}
