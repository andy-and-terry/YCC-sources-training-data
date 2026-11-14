#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        dispatch_group_t g = dispatch_group_create();
        dispatch_queue_t q = dispatch_get_global_queue(0, 0);
        for (int i = 0; i < 3; i++)
            dispatch_group_async(g, q, ^{ /* work */ });
        dispatch_group_wait(g, DISPATCH_TIME_FOREVER);
        NSLog(@"all done");
    }
    return 0;
}
