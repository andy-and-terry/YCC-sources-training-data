#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSDictionary *> *items = @[
            @{ @"name": @"pear", @"qty": @3 },
            @{ @"name": @"apple", @"qty": @3 },
            @{ @"name": @"fig", @"qty": @9 },
        ];
        NSSortDescriptor *byQty = [NSSortDescriptor sortDescriptorWithKey:@"qty" ascending:NO];
        NSSortDescriptor *byName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sorted = [items sortedArrayUsingDescriptors:@[ byQty, byName ]];
        for (NSDictionary *d in sorted) {
            NSLog(@"%@ x%@", d[@"name"], d[@"qty"]);
        }
    }
    return 0;
}
