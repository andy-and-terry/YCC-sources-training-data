#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        __block int n = 0;
        void (^inc)(void) = ^{ n++; };
        inc(); inc();
        NSLog(@"%d", n);
    }
    return 0;
}
