#include <stdio.h>
#include <stdlib.h>

typedef enum { RED, BLACK } Color;

typedef struct Node {
    int key;
    Color color;
    struct Node *left, *right, *parent;
} Node;

Node *root = NULL;

Node *new_node(int key) {
    Node *n = malloc(sizeof(Node));
    n->key = key;
    n->color = RED;
    n->left = n->right = n->parent = NULL;
    return n;
}

void rotate_left(Node *x) {
    Node *y = x->right;
    x->right = y->left;
    if (y->left) y->left->parent = x;
    y->parent = x->parent;
    if (!x->parent) root = y;
    else if (x == x->parent->left) x->parent->left = y;
    else x->parent->right = y;
    y->left = x;
    x->parent = y;
}

void rotate_right(Node *x) {
    Node *y = x->left;
    x->left = y->right;
    if (y->right) y->right->parent = x;
    y->parent = x->parent;
    if (!x->parent) root = y;
    else if (x == x->parent->right) x->parent->right = y;
    else x->parent->left = y;
    y->right = x;
    x->parent = y;
}

void fix_violation(Node *z) {
    while (z->parent && z->parent->color == RED) {
        Node *grandparent = z->parent->parent;
        if (z->parent == grandparent->left) {
            Node *uncle = grandparent->right;
            if (uncle && uncle->color == RED) {
                z->parent->color = BLACK;
                uncle->color = BLACK;
                grandparent->color = RED;
                z = grandparent;
            } else {
                if (z == z->parent->right) {
                    z = z->parent;
                    rotate_left(z);
                }
                z->parent->color = BLACK;
                grandparent->color = RED;
                rotate_right(grandparent);
            }
        } else {
            Node *uncle = grandparent->left;
            if (uncle && uncle->color == RED) {
                z->parent->color = BLACK;
                uncle->color = BLACK;
                grandparent->color = RED;
                z = grandparent;
            } else {
                if (z == z->parent->left) {
                    z = z->parent;
                    rotate_right(z);
                }
                z->parent->color = BLACK;
                grandparent->color = RED;
                rotate_left(grandparent);
            }
        }
    }
    root->color = BLACK;
}

void insert(int key) {
    Node *z = new_node(key);
    Node *y = NULL;
    Node *x = root;

    while (x) {
        y = x;
        x = (z->key < x->key) ? x->left : x->right;
    }
    z->parent = y;
    if (!y) root = z;
    else if (z->key < y->key) y->left = z;
    else y->right = z;

    fix_violation(z);
}

void inorder(Node *n) {
    if (!n) return;
    inorder(n->left);
    printf("%d(%s) ", n->key, n->color == RED ? "R" : "B");
    inorder(n->right);
}

int main(void) {
    int values[] = {10, 20, 30, 15, 5, 1, 25};
    int n = sizeof(values) / sizeof(values[0]);

    for (int i = 0; i < n; i++) insert(values[i]);

    inorder(root);
    printf("\n");
    printf("root=%d color=%s\n", root->key, root->color == RED ? "R" : "B");
    return 0;
}
