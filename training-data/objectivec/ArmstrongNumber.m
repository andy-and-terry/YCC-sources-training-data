#import <Foundation/Foundation.h>

BOOL isArmstrong(NSInteger n) {
    NSString *digitsStr = [NSString stringWithFormat:@"%ld", (long)n];
    NSInteger power = digitsStr.length;
    NSInteger total = 0;
    for (NSUInteger i = 0; i < digitsStr.length; i++) {
        NSInteger d = [digitsStr characterAtIndex:i] - '0';
        total += (NSInteger)pow(d, power);
    }
    return total == n;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%d", isArmstrong(153));
        NSLog(@"%d", isArmstrong(154));
    }
    return 0;
}
