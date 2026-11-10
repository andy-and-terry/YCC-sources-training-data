#import <Foundation/Foundation.h>

static NSInteger pieces(NSInteger cuts) { return (cuts * cuts + cuts + 2) / 2; }

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (NSInteger n = 0; n < 10; n++) [out addObject:@(pieces(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]); // 1 2 4 7 11 16 22 29 37 46
    }
    return 0;
}
