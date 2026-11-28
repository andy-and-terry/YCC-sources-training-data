#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        int a[12] = {5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5};
        const int bs = 4;
        int blk[3] = {0};
        for (int i = 0; i < 12; i++) blk[i / bs] += a[i];
        int l = 2, r = 9, sum = 0;
        for (int i = l; i <= r;) {
            if (i % bs == 0 && i + bs - 1 <= r) { sum += blk[i / bs]; i += bs; }
            else sum += a[i++];
        }
        NSLog(@"%d", sum);
    }
    return 0;
}
