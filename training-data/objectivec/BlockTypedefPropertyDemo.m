#import <Foundation/Foundation.h>

typedef NSString *(^Formatter)(NSInteger);

@interface Report : NSObject
@property (nonatomic, copy) Formatter formatter;
- (void)printValues:(NSArray<NSNumber *> *)values;
@end

@implementation Report
- (void)printValues:(NSArray<NSNumber *> *)values {
    for (NSNumber *n in values) {
        NSString *line = self.formatter ? self.formatter(n.integerValue) : n.stringValue;
        NSLog(@"%@", line);
    }
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Report *r = [[Report alloc] init];
        [r printValues:@[@1, @2]];

        r.formatter = ^NSString *(NSInteger v) {
            return [NSString stringWithFormat:@"#%03ld", (long)v];
        };
        [r printValues:@[@1, @22, @333]];
    }
    return 0;
}
