#import <Foundation/Foundation.h>

NSArray<NSArray<NSNumber *> *> *selectActivities(NSArray<NSArray<NSNumber *> *> *activities) {
    NSArray<NSArray<NSNumber *> *> *sorted = [activities sortedArrayUsingComparator:^NSComparisonResult(NSArray<NSNumber *> *a, NSArray<NSNumber *> *b) {
        return [a[1] compare:b[1]];
    }];
    NSMutableArray<NSArray<NSNumber *> *> *selected = [NSMutableArray array];
    NSInteger lastFinish = NSIntegerMin;
    for (NSArray<NSNumber *> *activity in sorted) {
        NSInteger start = activity[0].integerValue;
        NSInteger finish = activity[1].integerValue;
        if (start >= lastFinish) {
            [selected addObject:activity];
            lastFinish = finish;
        }
    }
    return selected;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSArray<NSNumber *> *> *activities = @[
            @[ @1, @4 ], @[ @3, @5 ], @[ @0, @6 ], @[ @5, @7 ], @[ @3, @9 ], @[ @5, @9 ], @[ @6, @10 ], @[ @8, @11 ]
        ];
        NSLog(@"%@", selectActivities(activities));
    }
    return 0;
}
