#import <Foundation/Foundation.h>

static uint16_t fletcher16(NSData *data) {
    uint16_t s1 = 0, s2 = 0;
    const uint8_t *bytes = data.bytes;
    for (NSUInteger i = 0; i < data.length; i++) {
        s1 = (s1 + bytes[i]) % 255;
        s2 = (s2 + s1) % 255;
    }
    return (uint16_t)((s2 << 8) | s1);
}

int main(void) {
    @autoreleasepool {
        NSData *d = [@"abcde" dataUsingEncoding:NSASCIIStringEncoding];
        NSLog(@"%x", fletcher16(d));
    }
    return 0;
}
