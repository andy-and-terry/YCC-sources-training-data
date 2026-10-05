#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSDictionary *> *people = @[
            @{ @"name": @"Ann", @"age": @31 },
            @{ @"name": @"Bob", @"age": @17 },
            @{ @"name": @"Cy", @"age": @45 },
        ];
        NSPredicate *adults = [NSPredicate predicateWithFormat:@"age >= %d", 18];
        NSArray *filtered = [people filteredArrayUsingPredicate:adults];
        NSLog(@"adults: %@", [filtered valueForKey:@"name"]);

        NSPredicate *startsWithA = [NSPredicate predicateWithFormat:@"name BEGINSWITH[c] %@", @"a"];
        NSLog(@"A-names: %@", [[people filteredArrayUsingPredicate:startsWithA] valueForKey:@"name"]);
    }
    return 0;
}
