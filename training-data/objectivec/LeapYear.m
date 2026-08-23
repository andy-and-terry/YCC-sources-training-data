#import <Foundation/Foundation.h>

BOOL isLeapYear(NSInteger year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%d", isLeapYear(2000));
        NSLog(@"%d", isLeapYear(1900));
        NSLog(@"%d", isLeapYear(2024));
    }
    return 0;
}
