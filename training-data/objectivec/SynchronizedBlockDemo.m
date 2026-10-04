#import <Foundation/Foundation.h>

@interface Counter : NSObject
@property (nonatomic) NSInteger value;
- (void)increment;
@end

@implementation Counter
- (void)increment {
    @synchronized (self) {
        self.value += 1;
    }
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Counter *c = [[Counter alloc] init];
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t q = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        for (int i = 0; i < 100; i++) {
            dispatch_group_async(group, q, ^{ [c increment]; });
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"value=%ld", (long)c.value);
    }
    return 0;
}
