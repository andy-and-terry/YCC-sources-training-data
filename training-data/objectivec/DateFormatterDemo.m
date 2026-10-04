#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        fmt.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";

        NSDate *date = [fmt dateFromString:@"2024-03-15 13:45:30"];
        NSLog(@"parsed epoch: %.0f", [date timeIntervalSince1970]);

        fmt.dateFormat = @"EEEE, d MMMM yyyy";
        NSLog(@"%@", [fmt stringFromDate:date]);

        NSCalendar *cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        cal.timeZone = fmt.timeZone;
        NSDate *later = [cal dateByAddingUnit:NSCalendarUnitDay value:20 toDate:date options:0];
        fmt.dateFormat = @"yyyy-MM-dd";
        NSLog(@"+20 days: %@", [fmt stringFromDate:later]);
        NSLog(@"seconds between: %.0f", [later timeIntervalSinceDate:date]);
    }
    return 0;
}
