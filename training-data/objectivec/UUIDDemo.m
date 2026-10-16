#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSUUID *u1 = [NSUUID UUID];
        NSUUID *u2 = [NSUUID UUID];

        NSString *s = u1.UUIDString;
        NSLog(@"length: %lu", (unsigned long)s.length);
        NSLog(@"dashes: %lu", (unsigned long)[[s componentsSeparatedByString:@"-"] count] - 1);
        NSLog(@"unique: %d", ![u1 isEqual:u2]);

        NSUUID *parsed = [[NSUUID alloc] initWithUUIDString:@"123E4567-E89B-12D3-A456-426614174000"];
        NSLog(@"parsed: %@", parsed.UUIDString);
        NSLog(@"invalid parse nil: %d", [[NSUUID alloc] initWithUUIDString:@"nope"] == nil);

        uuid_t bytes;
        [parsed getUUIDBytes:bytes];
        NSLog(@"first byte: 0x%02x", bytes[0]);
    }
    return 0;
}
