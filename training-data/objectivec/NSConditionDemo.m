#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSCondition *condition = [[NSCondition alloc] init];
        NSMutableArray *queue = [NSMutableArray array];
        dispatch_semaphore_t finished = dispatch_semaphore_create(0);

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            for (int i = 0; i < 3; i++) {
                [condition lock];
                while (queue.count == 0) [condition wait];
                NSLog(@"consumed %@", queue.firstObject);
                [queue removeObjectAtIndex:0];
                [condition unlock];
            }
            dispatch_semaphore_signal(finished);
        });

        for (int i = 1; i <= 3; i++) {
            [NSThread sleepForTimeInterval:0.02];
            [condition lock];
            [queue addObject:@(i)];
            [condition signal];
            [condition unlock];
        }
        dispatch_semaphore_wait(finished, DISPATCH_TIME_FOREVER);
    }
    return 0;
}
