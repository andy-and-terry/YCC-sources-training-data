#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray *items = @[@1, @2, @2, @3, @3, @4];
        NSCountedSet *set = [NSCountedSet setWithArray:items];
        NSUInteger top = 0;
        for (id x in set) top = MAX(top, [set countForObject:x]);
        NSMutableArray *modes = [NSMutableArray array];
        for (id x in set)
            if ([set countForObject:x] == top) [modes addObject:x];
        [modes sortUsingSelector:@selector(compare:)];
        NSLog(@"%@", modes);
    }
    return 0;
}
