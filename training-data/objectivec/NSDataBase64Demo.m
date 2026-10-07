#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSData *data = [@"Hello, Objective-C" dataUsingEncoding:NSUTF8StringEncoding];
        NSString *b64 = [data base64EncodedStringWithOptions:0];
        NSLog(@"%@", b64);
        NSData *back = [[NSData alloc] initWithBase64EncodedString:b64 options:0];
        NSLog(@"%@", [[NSString alloc] initWithData:back encoding:NSUTF8StringEncoding]);
    }
    return 0;
}
