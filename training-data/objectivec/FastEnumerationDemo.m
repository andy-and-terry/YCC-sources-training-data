#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *numbers = @[ @1, @2, @3, @4, @5 ];
        NSInteger total = 0;
        for (NSNumber *n in numbers) {
            total += n.integerValue;
        }
        NSLog(@"%ld", (long)total);

        NSMutableArray *doubled = [NSMutableArray array];
        for (NSNumber *n in numbers) {
            [doubled addObject:@(n.integerValue * 2)];
        }
        NSLog(@"%@", doubled);
    }
    return 0;
}
