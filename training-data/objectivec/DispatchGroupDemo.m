#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        NSMutableArray<NSNumber *> *results = [NSMutableArray array];
        NSLock *lock = [[NSLock alloc] init];

        for (int i = 1; i <= 5; i++) {
            dispatch_group_async(group, queue, ^{
                int value = i * i;
                [lock lock];
                [results addObject:@(value)];
                [lock unlock];
            });
        }

        long timedOut = dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
        NSLog(@"timed out: %ld", timedOut);

        NSArray *sorted = [results sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"results: %@", sorted);
        NSLog(@"sum: %@", [results valueForKeyPath:@"@sum.self"]);
    }
    return 0;
}
