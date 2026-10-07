#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        dispatch_queue_t queue = dispatch_queue_create("com.example.work", DISPATCH_QUEUE_CONCURRENT);
        dispatch_group_t group = dispatch_group_create();
        NSMutableArray<NSNumber *> *results = [NSMutableArray array];
        NSLock *lock = [[NSLock alloc] init];

        for (NSInteger i = 1; i <= 5; i++) {
            dispatch_group_async(group, queue, ^{
                NSInteger square = i * i;
                [lock lock];
                [results addObject:@(square)];
                [lock unlock];
            });
        }

        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSArray<NSNumber *> *sorted = [results sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"%@", sorted);
    }
    return 0;
}
