#import <Foundation/Foundation.h>

static uint8_t reverseBits(uint8_t v) {
    uint8_t r = 0;
    for (int i = 0; i < 8; i++) {
        r = (uint8_t)((r << 1) | (v & 1));
        v >>= 1;
    }
    return r;
}

int main(void) {
    @autoreleasepool {
        for (NSNumber *n in @[@1, @6, @13, @128]) {
            NSLog(@"%@ -> %u", n, reverseBits((uint8_t)n.intValue)); // 128 96 176 1
        }
    }
    return 0;
}
