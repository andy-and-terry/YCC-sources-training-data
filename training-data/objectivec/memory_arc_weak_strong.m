#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, strong) Node *child;
@property (nonatomic, weak) Node *parent;
@property (nonatomic, copy) NSString *name;
@end
@implementation Node
- (void)dealloc { NSLog(@"dealloc %@", self.name); }
@end

int main(void) {
    @autoreleasepool {
        Node *root = [Node new];
        root.name = @"root";
        {
            Node *kid = [Node new];
            kid.name = @"kid";
            root.child = kid;
            kid.parent = root;
        }
        NSLog(@"parent of child: %@", root.child.parent.name);
        __weak Node *w = root.child;
        root.child = nil;
        NSLog(@"weak is nil: %d", w == nil);
    }
    NSLog(@"end");
    return 0;
}
