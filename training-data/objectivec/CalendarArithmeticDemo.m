#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        cal.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];

        NSDateComponents *c = [[NSDateComponents alloc] init];
        c.year = 2024; c.month = 1; c.day = 31;
        NSDate *start = [cal dateFromComponents:c];

        NSDateComponents *plus = [[NSDateComponents alloc] init];
        plus.month = 1;
        NSDate *next = [cal dateByAddingComponents:plus toDate:start options:0];
        NSDateComponents *n = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:next];
        NSLog(@"Jan 31 + 1 month = %ld-%02ld-%02ld", (long)n.year, (long)n.month, (long)n.day);

        NSDateComponents *diff = [cal components:NSCalendarUnitDay fromDate:start toDate:next options:0];
        NSLog(@"days between: %ld", (long)diff.day);

        NSRange days = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:next];
        NSLog(@"days in Feb 2024: %lu", (unsigned long)days.length);
        NSLog(@"weekday: %ld", (long)[cal component:NSCalendarUnitWeekday fromDate:start]);
    }
    return 0;
}
