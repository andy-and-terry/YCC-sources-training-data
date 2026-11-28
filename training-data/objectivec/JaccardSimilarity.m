#import <Foundation/Foundation.h>

double jaccard(NSSet *a, NSSet *b) {
    NSMutableSet *inter = [a mutableCopy];
    [inter intersectSet:b];
    NSMutableSet *uni = [a mutableCopy];
    [uni unionSet:b];
    return uni.count == 0 ? 1.0 : (double)inter.count / uni.count;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%.2f", jaccard([NSSet setWithObjects:@1, @2, @3, @4, nil], [NSSet setWithObjects:@3, @4, @5, nil]));
    }
    return 0;
}
