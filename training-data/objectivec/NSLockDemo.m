#import <Foundation/Foundation.h>

@interface SafeCounter : NSObject
- (void)increment;
@property (readonly) NSInteger value;
@end

@implementation SafeCounter {
    NSLock *_lock;
    NSInteger _value;
}
- (instancetype)init {
    if ((self = [super init])) { _lock = [[NSLock alloc] init]; }
    return self;
}
- (void)increment {
    [_lock lock];
    _value++;
    [_lock unlock];
}
- (NSInteger)value {
    [_lock lock];
    NSInteger v = _value;
    [_lock unlock];
    return v;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        SafeCounter *counter = [[SafeCounter alloc] init];
        dispatch_group_t group = dispatch_group_create();
        for (int t = 0; t < 4; t++) {
            dispatch_group_async(group, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
                for (int i = 0; i < 1000; i++) [counter increment];
            });
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"final count: %ld", (long)counter.value);
    }
    return 0;
}
