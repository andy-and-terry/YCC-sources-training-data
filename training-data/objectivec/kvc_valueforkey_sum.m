#import <Foundation/Foundation.h>
int main(void) {
    @autoreleasepool {
        NSArray *rows = @[@{@"p": @3}, @{@"p": @4}];
        NSLog(@"%@", [rows valueForKeyPath:@"@sum.p"]);
    }
    return 0;
}
