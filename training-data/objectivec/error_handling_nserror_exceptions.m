#import <Foundation/Foundation.h>

static BOOL parse(NSString *s, NSInteger *out, NSError **err) {
    NSScanner *sc = [NSScanner scannerWithString:s];
    if (![sc scanInteger:out] || !sc.isAtEnd) {
        if (err) *err = [NSError errorWithDomain:@"demo" code:1 userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:@"bad number: %@", s]}];
        return NO;
    }
    return YES;
}

int main(void) {
    @autoreleasepool {
        for (NSString *s in @[@"42", @"x1"]) {
            NSInteger v = 0; NSError *e = nil;
            if (parse(s, &v, &e)) NSLog(@"ok %ld", (long)v);
            else NSLog(@"error %@ (%ld)", e.localizedDescription, (long)e.code);
        }
        @try {
            NSArray *a = @[@1];
            (void)[a objectAtIndex:5];
        } @catch (NSException *ex) {
            NSLog(@"caught %@", ex.name);
        } @finally {
            NSLog(@"finally");
        }
        @try { @throw [NSException exceptionWithName:@"Custom" reason:@"why" userInfo:nil]; }
        @catch (NSException *ex) { NSLog(@"%@: %@", ex.name, ex.reason); }
    }
    return 0;
}
