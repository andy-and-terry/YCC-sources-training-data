// Integer (1..3999) to Roman numeral using a greedy table.
#import <Foundation/Foundation.h>

static NSString *toRoman(int n) {
    static const int values[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    NSArray *symbols = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
    NSMutableString *out = [NSMutableString string];
    for (int i = 0; i < 13; i++)
        while (n >= values[i]) { [out appendString:symbols[i]]; n -= values[i]; }
    return out;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@ %@", toRoman(1994), toRoman(58));
    }
    return 0;
}
