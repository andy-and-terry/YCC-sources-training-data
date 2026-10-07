#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSCalendar *cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        cal.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        NSDateComponents *dc = [[NSDateComponents alloc] init];
        dc.year = 2024; dc.month = 2; dc.day = 28;
        NSDate *start = [cal dateFromComponents:dc];

        NSDateComponents *delta = [[NSDateComponents alloc] init];
        delta.day = 2;
        NSDate *later = [cal dateByAddingComponents:delta toDate:start options:0];
        NSDateComponents *out = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                       fromDate:later];
        NSLog(@"%04ld-%02ld-%02ld", (long)out.year, (long)out.month, (long)out.day);
        NSLog(@"days between: %ld", (long)[cal components:NSCalendarUnitDay fromDate:start toDate:later options:0].day);
    }
    return 0;
}
