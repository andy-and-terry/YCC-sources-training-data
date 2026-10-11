#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        double fl = 0.1 + 0.2;
        NSLog(@"double 0.1 + 0.2 == 0.3: %d", fl == 0.3);

        NSDecimalNumber *a = [NSDecimalNumber decimalNumberWithString:@"0.1"];
        NSDecimalNumber *b = [NSDecimalNumber decimalNumberWithString:@"0.2"];
        NSDecimalNumber *sum = [a decimalNumberByAdding:b];
        NSLog(@"decimal sum: %@ equals 0.3: %d", sum,
              [sum isEqualToNumber:[NSDecimalNumber decimalNumberWithString:@"0.3"]]);

        NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:@"19.99"];
        NSDecimalNumber *qty = [NSDecimalNumber decimalNumberWithString:@"3"];
        NSDecimalNumber *total = [price decimalNumberByMultiplyingBy:qty];
        NSLog(@"total: %@", total);

        NSDecimalNumberHandler *round2 = [NSDecimalNumberHandler
            decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2
            raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
        NSDecimalNumber *third = [[NSDecimalNumber decimalNumberWithString:@"10"]
            decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"3"] withBehavior:round2];
        NSLog(@"10/3 rounded: %@", third);
    }
    return 0;
}
