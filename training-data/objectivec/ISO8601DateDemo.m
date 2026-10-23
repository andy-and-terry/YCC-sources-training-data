#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        // ISO 8601 parsing and printing with a dedicated formatter.
        NSISO8601DateFormatter *iso = [[NSISO8601DateFormatter alloc] init];
        NSDate *start = [iso dateFromString:@"2024-03-15T09:30:00Z"];
        NSDate *end   = [iso dateFromString:@"2024-03-17T18:45:30Z"];
        NSLog(@"start: %@", [iso stringFromDate:start]);

        // Date-only output by choosing format options.
        iso.formatOptions = NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithDashSeparatorInDate;
        NSLog(@"date only: %@", [iso stringFromDate:end]);

        // NSDateInterval represents a span between two instants.
        NSDateInterval *span = [[NSDateInterval alloc] initWithStartDate:start endDate:end];
        NSLog(@"duration: %.0f seconds (%.2f days)", span.duration, span.duration / 86400.0);

        NSDate *probe = [iso dateFromString:@"2024-03-16"];
        NSLog(@"contains probe: %@", [span containsDate:probe] ? @"yes" : @"no");

        NSDateInterval *other = [[NSDateInterval alloc]
            initWithStartDate:[start dateByAddingTimeInterval:86400 * 2 - 3600]
                     duration:7200];
        NSDateInterval *overlap = [span intersectionWithDateInterval:other];
        NSLog(@"overlap: %.0f seconds", overlap.duration);
    }
    return 0;
}
