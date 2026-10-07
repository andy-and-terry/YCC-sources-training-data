#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";

        NSDate *date = [fmt dateFromString:@"2024-03-15 10:30:00"];
        NSDate *later = [date dateByAddingTimeInterval:86400 * 10];
        NSLog(@"parsed: %@", [fmt stringFromDate:date]);
        NSLog(@"+10 days: %@", [fmt stringFromDate:later]);
        NSLog(@"diff seconds: %.0f", [later timeIntervalSinceDate:date]);
    }
    return 0;
}
