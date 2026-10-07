#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableSet *a = [NSMutableSet setWithArray:@[ @1, @2, @3, @4 ]];
        NSSet *b = [NSSet setWithArray:@[ @3, @4, @5 ]];
        NSMutableSet *u = [a mutableCopy];
        [u unionSet:b];
        NSMutableSet *i = [a mutableCopy];
        [i intersectSet:b];
        NSMutableSet *d = [a mutableCopy];
        [d minusSet:b];
        NSLog(@"union=%lu inter=%lu diff=%lu", (unsigned long)u.count,
              (unsigned long)i.count, (unsigned long)d.count);
        NSLog(@"subset=%d", [i isSubsetOfSet:a]);
    }
    return 0;
}
