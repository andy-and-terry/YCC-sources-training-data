#include <stdio.h>
#include <stdlib.h>

typedef struct TreeNode {
    int value;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

TreeNode *insert(TreeNode *root, int value) {
    if (!root) {
        TreeNode *node = malloc(sizeof(TreeNode));
        node->value = value;
        node->left = node->right = NULL;
        return node;
    }
    if (value < root->value) root->left = insert(root->left, value);
    else root->right = insert(root->right, value);
    return root;
}

void inorder(TreeNode *root) {
    if (!root) return;
    inorder(root->left);
    printf("%d ", root->value);
    inorder(root->right);
}

int main(void) {
    TreeNode *root = NULL;
    int values[] = {5, 3, 8, 1, 4, 7, 9};
    for (int i = 0; i < 7; i++) root = insert(root, values[i]);
    inorder(root);
    printf("\n");
    return 0;
}
