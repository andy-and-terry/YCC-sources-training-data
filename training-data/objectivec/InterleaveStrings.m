#import <Foundation/Foundation.h>

static NSString *interleave(NSArray<NSString *> *parts) {
    NSUInteger longest = 0;
    for (NSString *p in parts) longest = MAX(longest, p.length);
    NSMutableString *out = [NSMutableString string];
    for (NSUInteger i = 0; i < longest; i++)
        for (NSString *p in parts)
            if (i < p.length) [out appendFormat:@"%C", [p characterAtIndex:i]];
    return out;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", interleave(@[@"abc", @"12345"]));
        NSLog(@"%@", interleave(@[@"ab", @"cd", @"efg"]));
    }
    return 0;
}
