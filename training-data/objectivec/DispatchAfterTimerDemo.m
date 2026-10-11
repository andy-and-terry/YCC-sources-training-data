#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        dispatch_semaphore_t done = dispatch_semaphore_create(0);

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)),
                       dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            NSLog(@"delayed block fired");
        });

        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,
                                                         dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0));
        __block int ticks = 0;
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, (uint64_t)(0.02 * NSEC_PER_SEC), 0);
        dispatch_source_set_event_handler(timer, ^{
            ticks++;
            NSLog(@"tick %d", ticks);
            if (ticks == 3) {
                dispatch_source_cancel(timer);
                dispatch_semaphore_signal(done);
            }
        });
        dispatch_resume(timer);

        dispatch_semaphore_wait(done, DISPATCH_TIME_FOREVER);
        [NSThread sleepForTimeInterval:0.1];
    }
    return 0;
}
