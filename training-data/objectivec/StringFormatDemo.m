#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = [NSString stringWithFormat:@"%05d|%-6s|%8.3f|%x", 42, "ab", 3.14159, 255];
        NSLog(@"%@", s);
        NSLog(@"%@", [@"hello world" capitalizedString]);
        NSLog(@"%@", [@"a,b,c" componentsSeparatedByString:@","]);
        NSLog(@"%@", [@[ @"x", @"y", @"z" ] componentsJoinedByString:@"-"]);
        NSLog(@"%lu", (unsigned long)[@"héllo" length]);
    }
    return 0;
}
