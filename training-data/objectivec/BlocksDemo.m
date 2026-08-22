#import <Foundation/Foundation.h>

typedef NSInteger (^IntTransform)(NSInteger);

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        IntTransform square = ^(NSInteger x) {
            return x * x;
        };

        NSArray<NSNumber *> *numbers = @[ @1, @2, @3, @4, @5 ];
        NSMutableArray<NSNumber *> *squares = [NSMutableArray array];
        for (NSNumber *n in numbers) {
            [squares addObject:@(square([n integerValue]))];
        }
        NSLog(@"%@", squares);
    }
    return 0;
}
