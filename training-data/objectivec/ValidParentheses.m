#import <Foundation/Foundation.h>

BOOL isValid(NSString *s) {
    NSMutableArray *stack = [NSMutableArray array];
    NSDictionary *pairs = @{ @")": @"(", @"]": @"[", @"}": @"{" };
    for (NSUInteger i = 0; i < s.length; i++) {
        NSString *c = [s substringWithRange:NSMakeRange(i, 1)];
        if ([c isEqualToString:@"("] || [c isEqualToString:@"["] || [c isEqualToString:@"{"]) {
            [stack addObject:c];
        } else if (pairs[c]) {
            if (stack.count == 0 || ![stack.lastObject isEqualToString:pairs[c]]) {
                return NO;
            }
            [stack removeLastObject];
        }
    }
    return stack.count == 0;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%d", isValid(@"{[()]}"));
        NSLog(@"%d", isValid(@"{[(])}"));
    }
    return 0;
}
