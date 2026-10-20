#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        dispatch_queue_t q = dispatch_queue_create("demo.serial", DISPATCH_QUEUE_SERIAL);
        dispatch_group_t g = dispatch_group_create();
        __block int total = 0;
        for (int i = 1; i <= 5; i++) {
            dispatch_group_async(g, q, ^{ total += i; });
        }
        dispatch_group_wait(g, DISPATCH_TIME_FOREVER);
        NSLog(@"total=%d", total);
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{ dispatch_semaphore_signal(sem); });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        static dispatch_once_t once;
        for (int i = 0; i < 3; i++) dispatch_once(&once, ^{ NSLog(@"once"); });
        dispatch_apply(3, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(size_t i) { (void)i; });
        dispatch_sync(q, ^{ NSLog(@"sync on serial"); });
    }
    return 0;
}
