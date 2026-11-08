#import <Foundation/Foundation.h>

NSData *varint(uint32_t n) {
    NSMutableData *d = [NSMutableData data];
    while (n >= 0x80) {
        uint8_t b = (n & 0x7F) | 0x80;
        [d appendBytes:&b length:1];
        n >>= 7;
    }
    uint8_t last = (uint8_t)n;
    [d appendBytes:&last length:1];
    return d;
}

int main(void) {
    @autoreleasepool { NSLog(@"%@", varint(300)); }
    return 0;
}
