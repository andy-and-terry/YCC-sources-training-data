#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        __block int count = 0;
        void (^inc)(void) = ^{ count++; };
        inc(); inc(); inc();
        NSLog(@"count=%d", count);
    }
    return 0;
}
