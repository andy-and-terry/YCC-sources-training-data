#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t q = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        __block NSInteger total = 0;
        NSLock *lock = [NSLock new];
        for (NSInteger i = 1; i <= 4; i++) {
            dispatch_group_async(group, q, ^{
                [lock lock];
                total += i * 10;
                [lock unlock];
            });
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"total=%ld", (long)total);
    }
    return 0;
}
