#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = @"abcabc";
        const int k = 3; const long B = 31, M = 1000003;
        for (NSUInteger i = 0; i + k <= s.length; i++) {
            long h = 0;
            for (int j = 0; j < k; j++) h = (h * B + [s characterAtIndex:i + j]) % M;
            NSLog(@"%lu %ld", (unsigned long)i, h);
        }
    }
    return 0;
}
