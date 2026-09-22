#include <stdio.h>
#include <stdlib.h>

typedef struct AVLNode {
    int value;
    int height;
    struct AVLNode *left;
    struct AVLNode *right;
} AVLNode;

int height_of(AVLNode *node) {
    return node ? node->height : 0;
}

int max_int(int a, int b) {
    return a > b ? a : b;
}

AVLNode *make_node(int value) {
    AVLNode *node = malloc(sizeof(AVLNode));
    node->value = value;
    node->height = 1;
    node->left = node->right = NULL;
    return node;
}

AVLNode *rotate_right(AVLNode *y) {
    AVLNode *x = y->left;
    AVLNode *t2 = x->right;
    x->right = y;
    y->left = t2;
    y->height = max_int(height_of(y->left), height_of(y->right)) + 1;
    x->height = max_int(height_of(x->left), height_of(x->right)) + 1;
    return x;
}

AVLNode *rotate_left(AVLNode *x) {
    AVLNode *y = x->right;
    AVLNode *t2 = y->left;
    y->left = x;
    x->right = t2;
    x->height = max_int(height_of(x->left), height_of(x->right)) + 1;
    y->height = max_int(height_of(y->left), height_of(y->right)) + 1;
    return y;
}

int balance_factor(AVLNode *node) {
    return node ? height_of(node->left) - height_of(node->right) : 0;
}

AVLNode *insert(AVLNode *node, int value) {
    if (!node) return make_node(value);

    if (value < node->value) node->left = insert(node->left, value);
    else if (value > node->value) node->right = insert(node->right, value);
    else return node;

    node->height = 1 + max_int(height_of(node->left), height_of(node->right));
    int balance = balance_factor(node);

    if (balance > 1 && value < node->left->value) return rotate_right(node);
    if (balance < -1 && value > node->right->value) return rotate_left(node);
    if (balance > 1 && value > node->left->value) {
        node->left = rotate_left(node->left);
        return rotate_right(node);
    }
    if (balance < -1 && value < node->right->value) {
        node->right = rotate_right(node->right);
        return rotate_left(node);
    }
    return node;
}

void inorder(AVLNode *node) {
    if (!node) return;
    inorder(node->left);
    printf("%d ", node->value);
    inorder(node->right);
}

int main(void) {
    AVLNode *root = NULL;
    int values[] = {10, 20, 30, 40, 50, 25};
    int n = sizeof(values) / sizeof(values[0]);

    for (int i = 0; i < n; i++) root = insert(root, values[i]);

    inorder(root);
    printf("\n");
    printf("root=%d height=%d\n", root->value, root->height);

    return 0;
}
