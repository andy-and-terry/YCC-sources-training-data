#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray *people = @[@{@"n": @"ann", @"a": @30}, @{@"n": @"bob", @"a": @17}];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"a >= 18"];
        NSLog(@"%@", [people filteredArrayUsingPredicate:p]);
        NSLog(@"%@", [people valueForKeyPath:@"@avg.a"]);
    }
    return 0;
}
