#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *settings = @{
            @"name": @"demo",
            @"version": @3,
            @"enabled": @YES,
            @"tags": @[@"a", @"b"],
            @"created": [NSDate dateWithTimeIntervalSince1970:0],
        };

        NSError *error = nil;
        NSData *xml = [NSPropertyListSerialization dataWithPropertyList:settings
                                                                 format:NSPropertyListXMLFormat_v1_0
                                                                options:0
                                                                  error:&error];
        NSString *text = [[NSString alloc] initWithData:xml encoding:NSUTF8StringEncoding];
        NSLog(@"xml has plist header: %d", [text containsString:@"<plist"]);

        NSData *binary = [NSPropertyListSerialization dataWithPropertyList:settings
                                                                    format:NSPropertyListBinaryFormat_v1_0
                                                                   options:0
                                                                     error:&error];
        NSLog(@"binary smaller: %d", binary.length < xml.length);

        NSDictionary *back = [NSPropertyListSerialization propertyListWithData:binary
                                                                       options:NSPropertyListImmutable
                                                                        format:NULL
                                                                         error:&error];
        NSLog(@"round trip equal: %d", [back isEqualToDictionary:settings]);
    }
    return 0;
}
