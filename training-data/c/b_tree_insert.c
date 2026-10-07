#include <stdio.h>
#include <stdlib.h>

#define MIN_DEGREE 3
#define MAX_KEYS (2 * MIN_DEGREE - 1)

typedef struct BTreeNode {
    int keys[MAX_KEYS];
    struct BTreeNode *children[MAX_KEYS + 1];
    int num_keys;
    int is_leaf;
} BTreeNode;

BTreeNode *create_node(int is_leaf) {
    BTreeNode *node = malloc(sizeof(BTreeNode));
    node->num_keys = 0;
    node->is_leaf = is_leaf;
    for (int i = 0; i <= MAX_KEYS; i++) node->children[i] = NULL;
    return node;
}

void split_child(BTreeNode *parent, int index) {
    BTreeNode *full = parent->children[index];
    BTreeNode *sibling = create_node(full->is_leaf);
    sibling->num_keys = MIN_DEGREE - 1;

    for (int j = 0; j < MIN_DEGREE - 1; j++) sibling->keys[j] = full->keys[j + MIN_DEGREE];
    if (!full->is_leaf) {
        for (int j = 0; j < MIN_DEGREE; j++) sibling->children[j] = full->children[j + MIN_DEGREE];
    }

    int mid_key = full->keys[MIN_DEGREE - 1];
    full->num_keys = MIN_DEGREE - 1;

    for (int j = parent->num_keys; j >= index + 1; j--) parent->children[j + 1] = parent->children[j];
    parent->children[index + 1] = sibling;

    for (int j = parent->num_keys - 1; j >= index; j--) parent->keys[j + 1] = parent->keys[j];
    parent->keys[index] = mid_key;
    parent->num_keys++;
}

void insert_nonfull(BTreeNode *node, int key) {
    int i = node->num_keys - 1;

    if (node->is_leaf) {
        while (i >= 0 && node->keys[i] > key) {
            node->keys[i + 1] = node->keys[i];
            i--;
        }
        node->keys[i + 1] = key;
        node->num_keys++;
    } else {
        while (i >= 0 && node->keys[i] > key) i--;
        i++;
        if (node->children[i]->num_keys == MAX_KEYS) {
            split_child(node, i);
            if (node->keys[i] < key) i++;
        }
        insert_nonfull(node->children[i], key);
    }
}

BTreeNode *insert(BTreeNode *root, int key) {
    if (root->num_keys == MAX_KEYS) {
        BTreeNode *new_root = create_node(0);
        new_root->children[0] = root;
        split_child(new_root, 0);
        insert_nonfull(new_root, key);
        return new_root;
    }
    insert_nonfull(root, key);
    return root;
}

void inorder(BTreeNode *node) {
    if (!node) return;
    int i;
    for (i = 0; i < node->num_keys; i++) {
        if (!node->is_leaf) inorder(node->children[i]);
        printf("%d ", node->keys[i]);
    }
    if (!node->is_leaf) inorder(node->children[i]);
}

int main(void) {
    BTreeNode *root = create_node(1);
    int values[] = {10, 20, 5, 6, 12, 30, 7, 17, 3, 25, 1, 9};
    int n = sizeof(values) / sizeof(values[0]);

    for (int i = 0; i < n; i++) root = insert(root, values[i]);

    printf("inorder: ");
    inorder(root);
    printf("\n");
    printf("root has %d keys\n", root->num_keys);
    return 0;
}
