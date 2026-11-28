#import <Foundation/Foundation.h>

@interface Config : NSObject
+ (instancetype)shared;
@end

@implementation Config
+ (instancetype)shared {
    static Config *c; static dispatch_once_t once;
    dispatch_once(&once, ^{ c = [Config new]; });
    return c;
}
@end

int main(void) {
    @autoreleasepool { NSLog(@"%d", [Config shared] == [Config shared]); }
    return 0;
}
