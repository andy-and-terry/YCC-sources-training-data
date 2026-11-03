#import <Foundation/Foundation.h>

static NSUInteger countPrimesBelow(NSUInteger n) {
    if (n < 3) return 0;
    NSMutableData *flags = [NSMutableData dataWithLength:n];
    uint8_t *composite = flags.mutableBytes;
    NSUInteger count = 0;
    for (NSUInteger i = 2; i < n; i++) {
        if (composite[i]) continue;
        count++;
        for (NSUInteger j = i * i; j < n; j += i) composite[j] = 1;
    }
    return count;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%lu", (unsigned long)countPrimesBelow(100));
    }
    return 0;
}
