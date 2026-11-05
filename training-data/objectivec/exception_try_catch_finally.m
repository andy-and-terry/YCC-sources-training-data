#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        @try {
            NSArray *a = @[@1];
            (void)a[5];
        } @catch (NSException *e) {
            NSLog(@"caught: %@", e.name);
        } @finally {
            NSLog(@"cleanup");
        }
    }
    return 0;
}
