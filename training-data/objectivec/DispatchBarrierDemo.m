#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        dispatch_queue_t queue = dispatch_queue_create("demo.rw", DISPATCH_QUEUE_CONCURRENT);
        __block NSMutableArray *log = [NSMutableArray array];
        dispatch_group_t group = dispatch_group_create();

        for (int i = 0; i < 3; i++) {
            dispatch_group_async(group, queue, ^{
                [NSThread sleepForTimeInterval:0.01];
            });
        }

        dispatch_barrier_async(queue, ^{
            [log addObject:@"barrier ran after the readers"];
        });

        dispatch_group_async(group, queue, ^{
            [NSThread sleepForTimeInterval:0.01];
        });

        dispatch_barrier_sync(queue, ^{
            [log addObject:@"second barrier"];
        });

        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"%@", log);
    }
    return 0;
}
