#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = @"Hello, World";
        NSLog(@"%lu %@ %@", (unsigned long)s.length, [s uppercaseString], [s substringFromIndex:7]);
        NSLog(@"%@ %@", [s substringWithRange:NSMakeRange(0, 5)], [s stringByReplacingOccurrencesOfString:@"l" withString:@"L"]);
        NSRange r = [s rangeOfString:@"World"];
        NSLog(@"%lu %lu %d", (unsigned long)r.location, (unsigned long)r.length, [s hasPrefix:@"Hello"]);
        NSLog(@"%@", [s componentsSeparatedByString:@", "]);
        NSLog(@"%@", [NSString stringWithFormat:@"%05.1f|%-5s|%3d|%x|%@", 3.14159, "ab", 7, 255, @"obj"]);
        NSLog(@"%d %f %lld", [@"42" intValue], [@"2.5" doubleValue], [@"9000000000" longLongValue]);
        NSLog(@"%@", [@"  trim  " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);
        NSMutableString *ms = [NSMutableString stringWithString:@"abc"];
        [ms appendString:@"def"];
        [ms insertString:@"-" atIndex:3];
        NSLog(@"%@ %d", ms, [@"a" isEqualToString:@"a"]);
        NSLog(@"%@", [@"Test" stringByAppendingFormat:@"%d", 5]);
        unichar c = [s characterAtIndex:1];
        NSLog(@"%C %lu", c, (unsigned long)[s lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    }
    return 0;
}
