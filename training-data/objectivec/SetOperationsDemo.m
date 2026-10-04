#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSSet *a = [NSSet setWithArray:@[ @1, @2, @3, @4 ]];
        NSSet *b = [NSSet setWithArray:@[ @3, @4, @5 ]];

        NSMutableSet *u = [a mutableCopy];
        [u unionSet:b];
        NSMutableSet *i = [a mutableCopy];
        [i intersectSet:b];
        NSMutableSet *d = [a mutableCopy];
        [d minusSet:b];

        NSLog(@"union=%@", [[u allObjects] sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"intersect=%@", [[i allObjects] sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"diff=%@", [[d allObjects] sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"subset=%d", [i isSubsetOfSet:a]);
    }
    return 0;
}
