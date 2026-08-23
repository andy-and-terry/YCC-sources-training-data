#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *s = @"Hello, Objective-C World!";
        NSLog(@"%@", s.uppercaseString);
        NSLog(@"%@", s.lowercaseString);
        NSLog(@"%lu", (unsigned long)s.length);
        NSLog(@"%@", [s componentsSeparatedByString:@" "]);
        NSLog(@"%@", [s stringByReplacingOccurrencesOfString:@"World" withString:@"Programming"]);
    }
    return 0;
}
