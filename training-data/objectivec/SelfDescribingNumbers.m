#import <Foundation/Foundation.h>

BOOL isSelfDescribing(NSString *s) {
    for (NSUInteger i = 0; i < s.length; i++) {
        unichar target = (unichar)('0' + i);
        NSUInteger count = 0;
        for (NSUInteger j = 0; j < s.length; j++) {
            if ([s characterAtIndex:j] == target) count++;
        }
        if (count != (NSUInteger)([s characterAtIndex:i] - '0')) return NO;
    }
    return YES;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (NSString *s in @[@"1210", @"2020", @"21200", @"1211"]) {
            NSLog(@"%@ %d", s, isSelfDescribing(s));
        }
    }
    return 0;
}
