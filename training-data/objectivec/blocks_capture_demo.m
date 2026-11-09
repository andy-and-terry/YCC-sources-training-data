#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        __block int count = 0;
        int base = 10;
        void (^inc)(void) = ^{ count += base; };
        inc(); inc();
        NSLog(@"%d", count);
    }
    return 0;
}
