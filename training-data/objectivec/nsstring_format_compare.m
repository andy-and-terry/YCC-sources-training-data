#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *a = [NSString stringWithFormat:@"%@-%03d", @"id", 7];
        NSLog(@"%@ %d %d", a, [a hasPrefix:@"id"], [a isEqualToString:@"id-007"]);
        NSLog(@"%@", [a componentsSeparatedByString:@"-"]);
    }
    return 0;
}
