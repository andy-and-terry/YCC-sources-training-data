#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSData *raw = [@"Hello, Objective-C!" dataUsingEncoding:NSUTF8StringEncoding];
        NSString *encoded = [raw base64EncodedStringWithOptions:0];
        NSLog(@"encoded: %@", encoded);
        NSData *decoded = [[NSData alloc] initWithBase64EncodedString:encoded options:0];
        NSLog(@"decoded: %@", [[NSString alloc] initWithData:decoded encoding:NSUTF8StringEncoding]);
    }
    return 0;
}
