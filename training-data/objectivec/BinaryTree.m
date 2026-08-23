#import <Foundation/Foundation.h>

@interface TreeNode : NSObject
@property (nonatomic) NSInteger value;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;
@end

@implementation TreeNode
@end

TreeNode *insertNode(TreeNode *node, NSInteger value) {
    if (!node) {
        TreeNode *newNode = [[TreeNode alloc] init];
        newNode.value = value;
        return newNode;
    }
    if (value < node.value) {
        node.left = insertNode(node.left, value);
    } else if (value > node.value) {
        node.right = insertNode(node.right, value);
    }
    return node;
}

void inorder(TreeNode *node, NSMutableArray *result) {
    if (!node) return;
    inorder(node.left, result);
    [result addObject:@(node.value)];
    inorder(node.right, result);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        TreeNode *root = nil;
        for (NSNumber *v in @[ @5, @3, @8, @1, @4, @7, @9 ]) {
            root = insertNode(root, v.integerValue);
        }
        NSMutableArray *result = [NSMutableArray array];
        inorder(root, result);
        NSLog(@"%@", result);
    }
    return 0;
}
