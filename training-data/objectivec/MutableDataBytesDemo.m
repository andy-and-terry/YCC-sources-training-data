#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableData *data = [NSMutableData data];

        uint8_t header[] = {0xCA, 0xFE, 0xBA, 0xBE};
        [data appendBytes:header length:sizeof(header)];

        uint32_t value = CFSwapInt32HostToBig(42);
        [data appendBytes:&value length:sizeof(value)];

        NSLog(@"length = %lu", (unsigned long)data.length);

        const uint8_t *bytes = data.bytes;
        NSMutableString *hex = [NSMutableString string];
        for (NSUInteger i = 0; i < data.length; i++) {
            [hex appendFormat:@"%02x", bytes[i]];
        }
        NSLog(@"%@", hex);

        uint32_t readBack = 0;
        [data getBytes:&readBack range:NSMakeRange(4, 4)];
        NSLog(@"read back = %u", CFSwapInt32BigToHost(readBack));

        [data replaceBytesInRange:NSMakeRange(0, 4) withBytes:"\0\0\0\0"];
        NSLog(@"%@", [data subdataWithRange:NSMakeRange(0, 4)]);
    }
    return 0;
}
