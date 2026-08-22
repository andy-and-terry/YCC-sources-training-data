#import <Foundation/Foundation.h>

@interface Stack : NSObject
@property(nonatomic, strong) NSMutableArray *items;
- (void)push:(id)item;
- (id)pop;
- (id)peek;
- (BOOL)isEmpty;
@end

@implementation Stack

- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
    }
    return self;
}

- (void)push:(id)item {
    [self.items addObject:item];
}

- (id)pop {
    id last = self.items.lastObject;
    if (last) [self.items removeLastObject];
    return last;
}

- (id)peek {
    return self.items.lastObject;
}

- (BOOL)isEmpty {
    return self.items.count == 0;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Stack *stack = [[Stack alloc] init];
        [stack push:@1];
        [stack push:@2];
        [stack push:@3];
        NSLog(@"%@ %@ %d", [stack pop], [stack peek], [stack isEmpty]);
    }
    return 0;
}
