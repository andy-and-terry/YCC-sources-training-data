#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSInteger count = 42;
        double ratio = 0.756;
        NSString *name = @"widget";

        NSString *line = [NSString stringWithFormat:@"%@: %ld items (%.1f%%)", name, (long)count, ratio * 100];
        NSLog(@"%@", line);
        NSLog(@"%@", [NSString stringWithFormat:@"[%5ld] [%-5ld] [%05ld]", (long)7, (long)7, (long)7]);
        NSLog(@"%@", [NSString stringWithFormat:@"hex=%lx octal=%lo", (long)255, (long)8]);

        NSMutableString *csv = [NSMutableString string];
        for (int i = 1; i <= 3; i++) {
            [csv appendFormat:@"%d,", i * i];
        }
        [csv deleteCharactersInRange:NSMakeRange(csv.length - 1, 1)];
        NSLog(@"%@", csv);
    }
    return 0;
}
