#import <Foundation/Foundation.h>

@interface Logger : NSObject
+ (instancetype)sharedLogger;
- (void)log:(NSString *)message;
@end

@implementation Logger
+ (instancetype)sharedLogger {
    static Logger *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)log:(NSString *)message {
    NSLog(@"[LOG] %@", message);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Logger *first = [Logger sharedLogger];
        Logger *second = [Logger sharedLogger];
        [first log:@"first message"];
        [second log:@"second message"];
        NSLog(@"same instance: %@", first == second ? @"YES" : @"NO");
    }
    return 0;
}
