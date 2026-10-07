#import <Foundation/Foundation.h>

// Rabin-Karp searches for a pattern by rolling a hash across the text
// instead of recomparing every character at every position. The hash of
// each window is derived from the previous one in O(1), and full
// character comparison only happens when the hashes already match,
// which keeps the average case close to linear.
static const NSInteger kBase = 256;
static const NSInteger kModulus = 1000000007;

NSMutableArray<NSNumber *> *rabinKarpSearch(NSString *text, NSString *pattern) {
    NSMutableArray<NSNumber *> *matches = [NSMutableArray array];
    NSInteger n = text.length;
    NSInteger m = pattern.length;
    if (m == 0 || m > n) return matches;

    NSInteger highOrder = 1;
    for (NSInteger i = 0; i < m - 1; i++) highOrder = (highOrder * kBase) % kModulus;

    NSInteger patternHash = 0;
    NSInteger windowHash = 0;
    for (NSInteger i = 0; i < m; i++) {
        patternHash = (patternHash * kBase + [pattern characterAtIndex:i]) % kModulus;
        windowHash = (windowHash * kBase + [text characterAtIndex:i]) % kModulus;
    }

    for (NSInteger i = 0; i <= n - m; i++) {
        if (windowHash == patternHash) {
            BOOL matched = YES;
            for (NSInteger j = 0; j < m; j++) {
                if ([text characterAtIndex:i + j] != [pattern characterAtIndex:j]) {
                    matched = NO;
                    break;
                }
            }
            if (matched) [matches addObject:@(i)];
        }
        if (i < n - m) {
            windowHash = (kBase * (windowHash - [text characterAtIndex:i] * highOrder) + [text characterAtIndex:i + m]) % kModulus;
            if (windowHash < 0) windowHash += kModulus;
        }
    }
    return matches;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *text = @"abracadabra needs no abracadabra";
        NSString *pattern = @"abracadabra";
        NSArray<NSNumber *> *matches = rabinKarpSearch(text, pattern);
        NSLog(@"matches at: %@", matches);

        NSLog(@"no match: %@", rabinKarpSearch(@"hello world", @"xyz"));
    }
    return 0;
}
