#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSNumber *n = @42;
        NSLog(@"%@ %d %f %@", n, n.intValue, n.doubleValue, @(3.5));
        NSNumberFormatter *f = [NSNumberFormatter new];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        f.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
        NSLog(@"%@", [f stringFromNumber:@1234567.891]);
        NSDateComponents *dc = [NSDateComponents new];
        dc.year = 2024; dc.month = 2; dc.day = 28; dc.hour = 12;
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        cal.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        NSDate *d = [cal dateFromComponents:dc];
        NSDateFormatter *df = [NSDateFormatter new];
        df.dateFormat = @"yyyy-MM-dd EEE";
        df.timeZone = cal.timeZone;
        df.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        NSLog(@"%@", [df stringFromDate:d]);
        NSDate *later = [d dateByAddingTimeInterval:86400 * 2];
        NSLog(@"%@", [df stringFromDate:later]);
        NSLog(@"%.0f", [later timeIntervalSinceDate:d]);
        NSLog(@"%d", [d compare:later] == NSOrderedAscending);
    }
    return 0;
}
