#import <Foundation/Foundation.h>

@interface HuffNode : NSObject
@property (nonatomic) NSInteger freq;
@property (nonatomic) unichar ch;
@property (nonatomic, strong) HuffNode *left;
@property (nonatomic, strong) HuffNode *right;
@end
@implementation HuffNode
@end

void buildCodes(HuffNode *node, NSString *prefix, NSMutableDictionary<NSString *, NSString *> *codes) {
    if (!node.left && !node.right) {
        codes[[NSString stringWithFormat:@"%C", node.ch]] = prefix.length > 0 ? prefix : @"0";
        return;
    }
    if (node.left) buildCodes(node.left, [prefix stringByAppendingString:@"0"], codes);
    if (node.right) buildCodes(node.right, [prefix stringByAppendingString:@"1"], codes);
}

NSDictionary<NSString *, NSString *> *huffmanCodes(NSString *text) {
    NSMutableDictionary<NSString *, NSNumber *> *freq = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < text.length; i++) {
        NSString *c = [NSString stringWithFormat:@"%C", [text characterAtIndex:i]];
        freq[c] = @([freq[c] integerValue] + 1);
    }

    NSMutableArray<HuffNode *> *nodes = [NSMutableArray array];
    for (NSString *c in freq) {
        HuffNode *n = [[HuffNode alloc] init];
        n.freq = [freq[c] integerValue];
        n.ch = [c characterAtIndex:0];
        [nodes addObject:n];
    }

    while (nodes.count > 1) {
        [nodes sortUsingComparator:^NSComparisonResult(HuffNode *a, HuffNode *b) {
            return [@(a.freq) compare:@(b.freq)];
        }];
        HuffNode *a = nodes[0];
        HuffNode *b = nodes[1];
        [nodes removeObjectsInRange:NSMakeRange(0, 2)];
        HuffNode *merged = [[HuffNode alloc] init];
        merged.freq = a.freq + b.freq;
        merged.left = a;
        merged.right = b;
        [nodes addObject:merged];
    }

    NSMutableDictionary<NSString *, NSString *> *codes = [NSMutableDictionary dictionary];
    if (nodes.count > 0) buildCodes(nodes[0], @"", codes);
    return codes;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", huffmanCodes(@"abracadabra"));
    }
    return 0;
}
