#import <Foundation/Foundation.h>

@interface Counter : NSObject
- (void)increment;
@property (nonatomic, readonly) NSInteger value;
@end

@implementation Counter {
    NSInteger _value;
}
- (void)increment {
    @synchronized(self) {
        _value++;
    }
}
- (NSInteger)value {
    @synchronized(self) {
        return _value;
    }
}
@end

int main(void) {
    @autoreleasepool {
        Counter *c = [Counter new];
        dispatch_apply(100, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(size_t i) {
            [c increment];
        });
        NSLog(@"%ld", (long)c.value);
    }
    return 0;
}
