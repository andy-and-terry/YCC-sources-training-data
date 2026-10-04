#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSSet<NSNumber *> *a = [NSSet setWithObjects:@1, @2, @3, @4, nil];
        NSSet<NSNumber *> *b = [NSSet setWithObjects:@3, @4, @5, nil];

        NSMutableSet *unionSet = [a mutableCopy];
        [unionSet unionSet:b];

        NSMutableSet *inter = [a mutableCopy];
        [inter intersectSet:b];

        NSMutableSet *diff = [a mutableCopy];
        [diff minusSet:b];

        NSSortDescriptor *asc = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        NSLog(@"union: %@", [unionSet sortedArrayUsingDescriptors:@[ asc ]]);
        NSLog(@"intersection: %@", [inter sortedArrayUsingDescriptors:@[ asc ]]);
        NSLog(@"difference: %@", [diff sortedArrayUsingDescriptors:@[ asc ]]);
        NSLog(@"subset: %d", [inter isSubsetOfSet:a]);
        NSLog(@"contains 5: %d", [a containsObject:@5]);
    }
    return 0;
}
