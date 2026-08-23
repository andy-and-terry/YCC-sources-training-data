#import <Foundation/Foundation.h>

NSInteger binaryToDecimal(NSString *s) {
    return strtol(s.UTF8String, NULL, 2);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)binaryToDecimal(@"1011"));
    }
    return 0;
}
