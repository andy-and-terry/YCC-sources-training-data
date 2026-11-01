#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        dispatch_queue_t q = dispatch_queue_create("com.example.serial", DISPATCH_QUEUE_SERIAL);
        dispatch_group_t g = dispatch_group_create();
        for (int i = 0; i < 3; i++)
            dispatch_group_async(g, q, ^{ NSLog(@"task %d", i); });
        dispatch_group_wait(g, DISPATCH_TIME_FOREVER);
    }
    return 0;
}
