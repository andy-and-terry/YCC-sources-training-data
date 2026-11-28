#import <Foundation/Foundation.h>

int popcount(unsigned long long n) {
    int c = 0;
    while (n) {
        n &= n - 1;
        c++;
    }
    return c;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%d %d", popcount(0xB7), __builtin_popcountll(0xB7));
    }
    return 0;
}
