#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        // The same instant renders differently in different time zones.
        NSDate *instant = [NSDate dateWithTimeIntervalSince1970:1700000000];

        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        fmt.dateFormat = @"yyyy-MM-dd HH:mm zzz";

        NSArray<NSString *> *names = @[@"UTC", @"America/New_York", @"Asia/Tokyo"];
        for (NSString *name in names) {
            fmt.timeZone = [NSTimeZone timeZoneWithName:name];
            NSLog(@"%@: %@", name, [fmt stringFromDate:instant]);
        }

        // Fixed offsets can be built from seconds east of GMT.
        NSTimeZone *plus530 = [NSTimeZone timeZoneForSecondsFromGMT:5 * 3600 + 30 * 60];
        NSLog(@"offset seconds: %ld", (long)[plus530 secondsFromGMTForDate:instant]);

        // Daylight saving offsets differ between winter and summer.
        NSTimeZone *ny = [NSTimeZone timeZoneWithName:@"America/New_York"];
        NSDate *summer = [NSDate dateWithTimeIntervalSince1970:1690000000];
        NSLog(@"NY winter: %ld, summer: %ld",
              (long)[ny secondsFromGMTForDate:instant],
              (long)[ny secondsFromGMTForDate:summer]);
    }
    return 0;
}
