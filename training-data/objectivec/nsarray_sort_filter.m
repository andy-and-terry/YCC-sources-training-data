#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray *a = @[@5, @3, @8, @1];
        NSArray *sorted = [a sortedArrayUsingSelector:@selector(compare:)];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"self > 2"];
        NSLog(@"%@ %@", sorted, [a filteredArrayUsingPredicate:p]);
    }
    return 0;
}
