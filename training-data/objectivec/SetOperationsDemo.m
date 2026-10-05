#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSSet<NSNumber *> *a = [NSSet setWithArray:@[ @1, @2, @3, @4 ]];
        NSSet<NSNumber *> *b = [NSSet setWithArray:@[ @3, @4, @5 ]];

        NSMutableSet *unionSet = [a mutableCopy];
        [unionSet unionSet:b];
        NSMutableSet *inter = [a mutableCopy];
        [inter intersectSet:b];
        NSMutableSet *diff = [a mutableCopy];
        [diff minusSet:b];

        NSLog(@"union: %@", [[unionSet allObjects] sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"intersection: %@", [[inter allObjects] sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"difference: %@", [[diff allObjects] sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"subset: %d", [inter isSubsetOfSet:a]);
    }
    return 0;
}
