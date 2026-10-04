#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *people = @[
            @{@"name": @"Zoe", @"age": @30},
            @{@"name": @"Adam", @"age": @25},
            @{@"name": @"Bob", @"age": @30},
        ];
        NSSortDescriptor *byAge = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
        NSSortDescriptor *byName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sorted = [people sortedArrayUsingDescriptors:@[ byAge, byName ]];
        for (NSDictionary *p in sorted) {
            NSLog(@"%@ (%@)", p[@"name"], p[@"age"]);
        }
    }
    return 0;
}
