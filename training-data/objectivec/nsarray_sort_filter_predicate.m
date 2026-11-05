#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray *words = @[@"pear", @"apple", @"fig", @"banana"];
        NSArray *sorted = [words sortedArrayUsingSelector:@selector(compare:)];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"length > 4"];
        NSLog(@"%@", sorted);
        NSLog(@"%@", [words filteredArrayUsingPredicate:p]);
    }
    return 0;
}
