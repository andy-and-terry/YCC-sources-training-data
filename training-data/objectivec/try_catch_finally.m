#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        @try {
            @throw [NSException exceptionWithName:@"Bad" reason:@"oops" userInfo:nil];
        } @catch (NSException *e) {
            NSLog(@"caught %@: %@", e.name, e.reason);
        } @finally {
            NSLog(@"cleanup");
        }
    }
    return 0;
}
