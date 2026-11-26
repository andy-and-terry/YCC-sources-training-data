// Squarefree numbers up to 100; expect 61.
#import <Foundation/Foundation.h>

static BOOL squarefree(NSInteger n) {
    for (NSInteger d = 2; d * d <= n; d++) if (n % (d * d) == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSInteger c = 0;
        for (NSInteger n = 1; n <= 100; n++) if (squarefree(n)) c++;
        NSLog(@"%ld", (long)c);
    }
    return 0;
}
