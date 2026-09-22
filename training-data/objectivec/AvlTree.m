#import <Foundation/Foundation.h>

@interface AvlNode : NSObject
@property (nonatomic) NSInteger value;
@property (nonatomic) NSInteger height;
@property (nonatomic, strong) AvlNode *left;
@property (nonatomic, strong) AvlNode *right;
@end

@implementation AvlNode
@end

static NSInteger AvlHeight(AvlNode *node) {
    return node == nil ? 0 : node.height;
}

static NSInteger AvlMax(NSInteger a, NSInteger b) {
    return a > b ? a : b;
}

static void AvlUpdateHeight(AvlNode *node) {
    node.height = 1 + AvlMax(AvlHeight(node.left), AvlHeight(node.right));
}

static NSInteger AvlBalanceFactor(AvlNode *node) {
    return node == nil ? 0 : AvlHeight(node.left) - AvlHeight(node.right);
}

static AvlNode *AvlRotateRight(AvlNode *y) {
    AvlNode *x = y.left;
    AvlNode *t2 = x.right;
    x.right = y;
    y.left = t2;
    AvlUpdateHeight(y);
    AvlUpdateHeight(x);
    return x;
}

static AvlNode *AvlRotateLeft(AvlNode *x) {
    AvlNode *y = x.right;
    AvlNode *t2 = y.left;
    y.left = x;
    x.right = t2;
    AvlUpdateHeight(x);
    AvlUpdateHeight(y);
    return y;
}

static AvlNode *AvlInsert(AvlNode *node, NSInteger value) {
    if (node == nil) {
        AvlNode *n = [[AvlNode alloc] init];
        n.value = value;
        n.height = 1;
        return n;
    }
    if (value < node.value) {
        node.left = AvlInsert(node.left, value);
    } else if (value > node.value) {
        node.right = AvlInsert(node.right, value);
    } else {
        return node;
    }

    AvlUpdateHeight(node);
    NSInteger bf = AvlBalanceFactor(node);

    if (bf > 1 && value < node.left.value) {
        return AvlRotateRight(node);
    }
    if (bf < -1 && value > node.right.value) {
        return AvlRotateLeft(node);
    }
    if (bf > 1 && value > node.left.value) {
        node.left = AvlRotateLeft(node.left);
        return AvlRotateRight(node);
    }
    if (bf < -1 && value < node.right.value) {
        node.right = AvlRotateRight(node.right);
        return AvlRotateLeft(node);
    }
    return node;
}

static void AvlInorder(AvlNode *node, NSMutableArray *out) {
    if (node == nil) return;
    AvlInorder(node.left, out);
    [out addObject:@(node.value)];
    AvlInorder(node.right, out);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        AvlNode *root = nil;
        NSArray *values = @[ @10, @20, @30, @40, @50, @25 ];
        for (NSNumber *v in values) {
            root = AvlInsert(root, v.integerValue);
        }
        NSMutableArray *result = [NSMutableArray array];
        AvlInorder(root, result);
        NSLog(@"%@", result);
        NSLog(@"%ld", (long)AvlHeight(root));
    }
    return 0;
}
