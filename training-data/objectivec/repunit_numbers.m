// Repunits: numbers made only of the digit 1.
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        long long r = 0;
        for (int i = 0; i < 5; i++) {
            r = r * 10 + 1;
            [out addObject:@(r)];
        }
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
