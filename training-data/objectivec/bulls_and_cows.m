// Bulls and Cows scoring for equal-length digit strings.
#import <Foundation/Foundation.h>

static void score(NSString *secret, NSString *guess, int *bulls, int *cows) {
    int sc[10] = {0}, gc[10] = {0};
    *bulls = *cows = 0;
    for (NSUInteger i = 0; i < secret.length; i++) {
        unichar s = [secret characterAtIndex:i], g = [guess characterAtIndex:i];
        if (s == g) (*bulls)++;
        else { sc[s - '0']++; gc[g - '0']++; }
    }
    for (int d = 0; d < 10; d++) *cows += MIN(sc[d], gc[d]);
}

int main(void) {
    @autoreleasepool {
        int b, c;
        score(@"1807", @"7810", &b, &c);
        NSLog(@"%d bull(s), %d cow(s)", b, c);
    }
    return 0;
}
