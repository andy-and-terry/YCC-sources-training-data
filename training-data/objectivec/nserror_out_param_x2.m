#import <Foundation/Foundation.h>

BOOL parse(NSString *s, int *out, NSError **err) {
    NSScanner *sc = [NSScanner scannerWithString:s];
    if (![sc scanInt:out]) {
        if (err) *err = [NSError errorWithDomain:@"demo" code:1 userInfo:@{NSLocalizedDescriptionKey: @"not a number"}];
        return NO;
    }
    return YES;
}

int main(void) {
    @autoreleasepool {
        int v; NSError *e = nil;
        if (!parse(@"abc", &v, &e)) NSLog(@"%@", e.localizedDescription);
    }
    return 0;
}
