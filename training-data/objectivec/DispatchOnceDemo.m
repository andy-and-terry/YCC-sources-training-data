#import <Foundation/Foundation.h>

static NSString *config(void) {
    static NSString *value;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSLog(@"initializing");
        value = @"loaded";
    });
    return value;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", config());
        NSLog(@"%@", config());
    }
    return 0;
}
