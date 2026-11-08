#import <Foundation/Foundation.h>

uint8_t crc8(const uint8_t *d, size_t n) {
    uint8_t crc = 0;
    while (n--) {
        crc ^= *d++;
        for (int i = 0; i < 8; i++) crc = (crc & 0x80) ? (uint8_t)((crc << 1) ^ 0x07) : (uint8_t)(crc << 1);
    }
    return crc;
}

int main(void) {
    @autoreleasepool {
        const char *s = "123456789";
        NSLog(@"%02x", crc8((const uint8_t *)s, strlen(s)));
    }
    return 0;
}
