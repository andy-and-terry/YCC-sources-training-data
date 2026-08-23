#import <Foundation/Foundation.h>

NSString *toRoman(NSInteger n) {
    NSArray *values = @[ @1000, @900, @500, @400, @100, @90, @50, @40, @10, @9, @5, @4, @1 ];
    NSArray *symbols = @[ @"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I" ];
    NSMutableString *result = [NSMutableString string];
    NSInteger remaining = n;
    for (NSUInteger i = 0; i < values.count; i++) {
        NSInteger v = [values[i] integerValue];
        while (remaining >= v) {
            [result appendString:symbols[i]];
            remaining -= v;
        }
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", toRoman(1994));
    }
    return 0;
}
