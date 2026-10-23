#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *people = @[
            @{@"name": @"Cy", @"age": @25},
            @{@"name": @"Ann", @"age": @30},
            @{@"name": @"Bob", @"age": @25}
        ];
        NSSortDescriptor *byAge = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
        NSSortDescriptor *byName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sorted = [people sortedArrayUsingDescriptors:@[byAge, byName]];
        for (NSDictionary *d in sorted) {
            NSLog(@"%@ %@", d[@"name"], d[@"age"]);
        }
    }
    return 0;
}
