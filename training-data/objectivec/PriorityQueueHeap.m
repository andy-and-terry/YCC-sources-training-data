#import <Foundation/Foundation.h>

@interface MinHeap : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *items;
- (void)push:(NSInteger)value;
- (NSInteger)pop;
- (BOOL)isEmpty;
@end

@implementation MinHeap
- (instancetype)init {
    self = [super init];
    if (self) _items = [NSMutableArray array];
    return self;
}

- (void)push:(NSInteger)value {
    [self.items addObject:@(value)];
    NSInteger i = self.items.count - 1;
    while (i > 0) {
        NSInteger parent = (i - 1) / 2;
        if ([self.items[parent] integerValue] <= [self.items[i] integerValue]) break;
        [self.items exchangeObjectAtIndex:parent withObjectAtIndex:i];
        i = parent;
    }
}

- (NSInteger)pop {
    NSInteger top = [self.items[0] integerValue];
    NSNumber *last = self.items.lastObject;
    [self.items removeLastObject];
    if (self.items.count > 0) {
        self.items[0] = last;
        NSInteger i = 0;
        while (YES) {
            NSInteger left = 2 * i + 1;
            NSInteger right = 2 * i + 2;
            NSInteger smallest = i;
            if (left < self.items.count && [self.items[left] integerValue] < [self.items[smallest] integerValue]) smallest = left;
            if (right < self.items.count && [self.items[right] integerValue] < [self.items[smallest] integerValue]) smallest = right;
            if (smallest == i) break;
            [self.items exchangeObjectAtIndex:i withObjectAtIndex:smallest];
            i = smallest;
        }
    }
    return top;
}

- (BOOL)isEmpty {
    return self.items.count == 0;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        MinHeap *heap = [[MinHeap alloc] init];
        for (NSNumber *v in @[ @5, @2, @8, @1, @9, @3 ]) [heap push:v.integerValue];
        while (![heap isEmpty]) {
            NSLog(@"%ld", (long)[heap pop]);
        }
    }
    return 0;
}
