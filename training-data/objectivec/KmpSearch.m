#import <Foundation/Foundation.h>

NSArray<NSNumber *> *buildLps(NSString *pattern) {
    NSInteger n = pattern.length;
    NSMutableArray<NSNumber *> *lps = [NSMutableArray arrayWithCapacity:n];
    for (NSInteger i = 0; i < n; i++) [lps addObject:@0];
    NSInteger len = 0;
    NSInteger i = 1;
    while (i < n) {
        if ([pattern characterAtIndex:i] == [pattern characterAtIndex:len]) {
            len++;
            lps[i] = @(len);
            i++;
        } else if (len != 0) {
            len = [lps[len - 1] integerValue];
        } else {
            lps[i] = @0;
            i++;
        }
    }
    return lps;
}

NSInteger kmpSearch(NSString *text, NSString *pattern) {
    NSArray<NSNumber *> *lps = buildLps(pattern);
    NSInteger n = text.length;
    NSInteger m = pattern.length;
    NSInteger i = 0, j = 0;
    while (i < n) {
        if ([text characterAtIndex:i] == [pattern characterAtIndex:j]) {
            i++; j++;
            if (j == m) return i - j;
        } else if (j > 0) {
            j = [lps[j - 1] integerValue];
        } else {
            i++;
        }
    }
    return -1;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)kmpSearch(@"abxabcabcaby", @"abcaby"));
    }
    return 0;
}
