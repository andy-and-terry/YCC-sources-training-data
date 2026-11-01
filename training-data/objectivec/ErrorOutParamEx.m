#import <Foundation/Foundation.h>

BOOL parseAge(NSString *s, NSInteger *out, NSError **err) {
    NSScanner *sc = [NSScanner scannerWithString:s];
    if (![sc scanInteger:out]) {
        if (err) *err = [NSError errorWithDomain:@"Parse" code:1 userInfo:@{NSLocalizedDescriptionKey: @"not a number"}];
        return NO;
    }
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSInteger n; NSError *e = nil;
        if (!parseAge(@"x", &n, &e)) NSLog(@"%@", e.localizedDescription);
        if (parseAge(@"42", &n, &e)) NSLog(@"%ld", (long)n);
    }
    return 0;
}
