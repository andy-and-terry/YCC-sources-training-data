#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *words = @[@"apple", @"banana", @"avocado", @"cherry"];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"a"];
        NSLog(@"%@", [words filteredArrayUsingPredicate:p]);

        NSArray *people = @[@{@"name": @"Ann", @"age": @30}, @{@"name": @"Bob", @"age": @20}];
        NSPredicate *adult = [NSPredicate predicateWithFormat:@"age >= 25"];
        NSLog(@"%@", [people filteredArrayUsingPredicate:adult]);
    }
    return 0;
}
