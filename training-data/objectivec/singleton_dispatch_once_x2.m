#import <Foundation/Foundation.h>

@interface Store : NSObject
+ (instancetype)shared;
@end
@implementation Store
+ (instancetype)shared {
    static Store *inst; static dispatch_once_t once;
    dispatch_once(&once, ^{ inst = [Store new]; });
    return inst;
}
@end

int main(void) {
    @autoreleasepool { NSLog(@"%d", [Store shared] == [Store shared]); }
    return 0;
}
