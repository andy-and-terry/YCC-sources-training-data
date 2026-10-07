#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSNumberFormatter *f = [NSNumberFormatter new];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        f.maximumFractionDigits = 2;
        f.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
        NSLog(@"%@", [f stringFromNumber:@1234567.891]);
        NSNumber *n = [f numberFromString:@"1,234.5"];
        NSLog(@"%@", n);
    }
    return 0;
}
