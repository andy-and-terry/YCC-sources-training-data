#import <Foundation/Foundation.h>
int main(void) {
    @autoreleasepool {
        dispatch_group_t g = dispatch_group_create();
        __block int n = 0;
        dispatch_queue_t q = dispatch_queue_create("c", DISPATCH_QUEUE_SERIAL);
        for (int i = 0; i < 3; i++) dispatch_group_async(g, q, ^{ n += i; });
        dispatch_group_wait(g, DISPATCH_TIME_FOREVER);
        NSLog(@"%d", n);
    }
    return 0;
}
