#import <Foundation/Foundation.h>

static NSString *addBinary(NSString *a, NSString *b) {
    NSMutableString *out = [NSMutableString string];
    NSInteger i = (NSInteger)a.length - 1, j = (NSInteger)b.length - 1, carry = 0;
    while (i >= 0 || j >= 0 || carry > 0) {
        NSInteger sum = carry;
        if (i >= 0) sum += [a characterAtIndex:i--] - '0';
        if (j >= 0) sum += [b characterAtIndex:j--] - '0';
        [out insertString:[NSString stringWithFormat:@"%ld", (long)(sum % 2)] atIndex:0];
        carry = sum / 2;
    }
    return out;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", addBinary(@"1010", @"1011")); // 10101
    }
    return 0;
}
