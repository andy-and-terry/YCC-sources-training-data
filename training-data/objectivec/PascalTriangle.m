#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSArray<NSNumber *> *> *rows = [NSMutableArray array];
        for (NSInteger r = 0; r < 6; r++) {
            NSMutableArray<NSNumber *> *row = [NSMutableArray array];
            for (NSInteger c = 0; c <= r; c++) {
                if (c == 0 || c == r) {
                    [row addObject:@1];
                } else {
                    NSArray<NSNumber *> *prev = rows[r - 1];
                    [row addObject:@([prev[c - 1] integerValue] + [prev[c] integerValue])];
                }
            }
            [rows addObject:row];
            NSLog(@"%@", [row componentsJoinedByString:@" "]);
        }
    }
    return 0;
}
