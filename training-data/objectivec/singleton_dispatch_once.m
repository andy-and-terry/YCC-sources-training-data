#import <Foundation/Foundation.h>

@interface Store : NSObject
+ (instancetype)shared;
@end
@implementation Store
+ (instancetype)shared {
    static Store *s;
    static dispatch_once_t once;
    dispatch_once(&once, ^{ s = [Store new]; });
    return s;
}
@end

int main(void) {
    @autoreleasepool { NSLog(@"%d", [Store shared] == [Store shared]); }
    return 0;
}
