#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
        fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];

        fmt.numberStyle = NSNumberFormatterDecimalStyle;
        NSLog(@"%@", [fmt stringFromNumber:@1234567.891]);

        fmt.numberStyle = NSNumberFormatterCurrencyStyle;
        NSLog(@"%@", [fmt stringFromNumber:@19.5]);

        fmt.numberStyle = NSNumberFormatterPercentStyle;
        NSLog(@"%@", [fmt stringFromNumber:@0.256]);

        fmt.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *parsed = [fmt numberFromString:@"1,250.5"];
        NSLog(@"parsed: %@", parsed);
        NSLog(@"invalid: %@", [fmt numberFromString:@"abc"]);
    }
    return 0;
}
