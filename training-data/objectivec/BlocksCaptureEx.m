#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        __block int count = 0;
        void (^inc)(void) = ^{ count++; };
        inc(); inc();
        int (^add)(int, int) = ^(int a, int b) { return a + b; };
        NSLog(@"%d %d", count, add(2, 3));
    }
    return 0;
}
