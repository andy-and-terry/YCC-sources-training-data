#import <Foundation/Foundation.h>

@interface Queue<ObjectType> : NSObject
@property (nonatomic, strong) NSMutableArray<ObjectType> *items;
- (void)enqueue:(ObjectType)item;
- (ObjectType)dequeue;
@end

@implementation Queue
- (instancetype)init {
    self = [super init];
    if (self) _items = [NSMutableArray array];
    return self;
}
- (void)enqueue:(id)item {
    [self.items addObject:item];
}
- (id)dequeue {
    id item = self.items.firstObject;
    [self.items removeObjectAtIndex:0];
    return item;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Queue<NSNumber *> *queue = [[Queue alloc] init];
        [queue enqueue:@1];
        [queue enqueue:@2];
        [queue enqueue:@3];
        NSLog(@"%@", [queue dequeue]);
        NSLog(@"%@", [queue dequeue]);
    }
    return 0;
}
