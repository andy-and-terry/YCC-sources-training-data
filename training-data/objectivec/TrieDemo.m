#import <Foundation/Foundation.h>

@interface TrieNode : NSObject
@property (nonatomic, strong) NSMutableDictionary<NSString *, TrieNode *> *children;
@property (nonatomic) BOOL isEnd;
@end

@implementation TrieNode
- (instancetype)init {
    self = [super init];
    if (self) _children = [NSMutableDictionary dictionary];
    return self;
}
@end

void trieInsert(TrieNode *root, NSString *word) {
    TrieNode *node = root;
    for (NSUInteger i = 0; i < word.length; i++) {
        NSString *c = [word substringWithRange:NSMakeRange(i, 1)];
        if (!node.children[c]) node.children[c] = [[TrieNode alloc] init];
        node = node.children[c];
    }
    node.isEnd = YES;
}

BOOL trieContains(TrieNode *root, NSString *word) {
    TrieNode *node = root;
    for (NSUInteger i = 0; i < word.length; i++) {
        NSString *c = [word substringWithRange:NSMakeRange(i, 1)];
        if (!node.children[c]) return NO;
        node = node.children[c];
    }
    return node.isEnd;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        TrieNode *trie = [[TrieNode alloc] init];
        trieInsert(trie, @"cat");
        trieInsert(trie, @"car");
        NSLog(@"%d", trieContains(trie, @"cat"));
        NSLog(@"%d", trieContains(trie, @"ca"));
    }
    return 0;
}
