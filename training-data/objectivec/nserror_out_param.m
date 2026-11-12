#import <Foundation/Foundation.h>
BOOL check(int x, NSError **err) {
    if (x < 0) { if (err) *err = [NSError errorWithDomain:@"app" code:1 userInfo:@{NSLocalizedDescriptionKey: @"negative"}]; return NO; }
    return YES;
}
int main(void) {
    @autoreleasepool { NSError *e = nil; if (!check(-1, &e)) NSLog(@"%@", e.localizedDescription); }
    return 0;
}
