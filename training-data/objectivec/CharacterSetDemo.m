#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *input = @"R2-D2 & C-3PO, 1977!";

        NSCharacterSet *digits = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *letters = [NSCharacterSet letterCharacterSet];

        NSUInteger d = 0, l = 0;
        for (NSUInteger i = 0; i < input.length; i++) {
            unichar c = [input characterAtIndex:i];
            if ([digits characterIsMember:c]) d++;
            else if ([letters characterIsMember:c]) l++;
        }
        NSLog(@"digits=%lu letters=%lu", (unsigned long)d, (unsigned long)l);

        NSCharacterSet *keep = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSString *clean = [[input componentsSeparatedByCharactersInSet:keep] componentsJoinedByString:@""];
        NSLog(@"alphanumeric only: %@", clean);

        NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
        NSLog(@"first vowel at: %lu", (unsigned long)[input rangeOfCharacterFromSet:vowels].location);
    }
    return 0;
}
