#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        cal.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        NSDateComponents *c = [NSDateComponents new];
        c.year = 2024; c.month = 2; c.day = 28;
        NSDate *d = [cal dateFromComponents:c];
        NSDateComponents *add = [NSDateComponents new];
        add.day = 2;
        NSDate *later = [cal dateByAddingComponents:add toDate:d options:0];
        NSDateComponents *out = [cal components:NSCalendarUnitMonth | NSCalendarUnitDay fromDate:later];
        NSLog(@"%ld-%ld", (long)out.month, (long)out.day);
    }
    return 0;
}
