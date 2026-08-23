#import <Foundation/Foundation.h>

@interface Stack<ObjectType> : NSObject
@property (nonatomic, strong) NSMutableArray<ObjectType> *items;
- (void)push:(ObjectType)item;
- (ObjectType)pop;
@end

@implementation Stack
- (instancetype)init {
    self = [super init];
    if (self) _items = [NSMutableArray array];
    return self;
}
- (void)push:(id)item {
    [self.items addObject:item];
}
- (id)pop {
    id item = self.items.lastObject;
    [self.items removeLastObject];
    return item;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Stack<NSNumber *> *stack = [[Stack alloc] init];
        [stack push:@1];
        [stack push:@2];
        [stack push:@3];
        NSLog(@"%@", [stack pop]);
        NSLog(@"%@", [stack pop]);
    }
    return 0;
}
