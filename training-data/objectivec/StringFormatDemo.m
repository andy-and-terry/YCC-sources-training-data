#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *s = [NSString stringWithFormat:@"%@ has %d items costing %.2f", @"Cart", 3, 19.989];
        NSLog(@"%@", s);
        NSLog(@"%@", [NSString stringWithFormat:@"%05d|%-6@|%6ld", 42, @"ab", 123L]);
        NSLog(@"hex=%x upper=%@", 255, [@"hello" uppercaseString]);
        NSLog(@"%@", [@"  trim me  " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);
    }
    return 0;
}
