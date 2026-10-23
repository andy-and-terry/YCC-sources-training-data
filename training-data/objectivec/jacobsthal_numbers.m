// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *terms = [NSMutableArray array];
        long a = 0, b = 1;
        for (int i = 0; i < 15; i++) {
            [terms addObject:@(a)];
            long next = b + 2 * a;
            a = b;
            b = next;
        }
        NSLog(@"%@", [terms componentsJoinedByString:@" "]);
    }
    return 0;
}
