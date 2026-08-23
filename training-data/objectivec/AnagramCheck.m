#import <Foundation/Foundation.h>

NSString *normalizeString(NSString *s) {
    NSString *lower = [s.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableArray *chars = [NSMutableArray array];
    for (NSUInteger i = 0; i < lower.length; i++) {
        [chars addObject:[NSString stringWithFormat:@"%C", [lower characterAtIndex:i]]];
    }
    NSArray *sorted = [chars sortedArrayUsingSelector:@selector(compare:)];
    return [sorted componentsJoinedByString:@""];
}

BOOL isAnagram(NSString *a, NSString *b) {
    return [normalizeString(a) isEqualToString:normalizeString(b)];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%d", isAnagram(@"listen", @"silent"));
        NSLog(@"%d", isAnagram(@"hello", @"world"));
    }
    return 0;
}
