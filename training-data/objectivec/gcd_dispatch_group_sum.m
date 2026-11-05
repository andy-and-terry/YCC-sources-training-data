#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        dispatch_group_t g = dispatch_group_create();
        dispatch_queue_t q = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        __block NSInteger total = 0;
        NSLock *lock = [NSLock new];
        for (int i = 1; i <= 5; i++) {
            dispatch_group_async(g, q, ^{
                [lock lock]; total += i; [lock unlock];
            });
        }
        dispatch_group_wait(g, DISPATCH_TIME_FOREVER);
        NSLog(@"total=%ld", (long)total);
    }
    return 0;
}
