#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary<NSString *, NSNumber *> *stock = @{
            @"apples" : @12,
            @"pears" : @0,
            @"plums" : @7,
        };

        for (NSString *key in [[stock allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
            NSLog(@"%@ -> %@", key, stock[key]);
        }

        __block NSInteger total = 0;
        [stock enumerateKeysAndObjectsUsingBlock:^(NSString *k, NSNumber *v, BOOL *stop) {
            total += v.integerValue;
        }];
        NSLog(@"total: %ld", (long)total);

        NSSet *empty = [stock keysOfEntriesPassingTest:^BOOL(NSString *k, NSNumber *v, BOOL *stop) {
            return v.integerValue == 0;
        }];
        NSLog(@"out of stock: %@", empty);
        NSLog(@"missing key: %@", stock[@"kiwis"] ?: @"n/a");
    }
    return 0;
}
