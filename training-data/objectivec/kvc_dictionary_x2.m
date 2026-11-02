#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary *d = @{@"name": @"ann", @"age": @30};
        NSLog(@"%@ %@", [d valueForKey:@"name"], d[@"age"]);
        NSArray *nums = @[@1, @2, @3];
        NSLog(@"%@", [nums valueForKeyPath:@"@sum.self"]);
    }
    return 0;
}
