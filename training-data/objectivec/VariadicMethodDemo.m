#import <Foundation/Foundation.h>

@interface Summer : NSObject
+ (NSInteger)sumOf:(NSInteger)first, ... NS_REQUIRES_NIL_TERMINATION;
+ (NSArray *)arrayWithObjectsNilTerminated:(id)first, ...;
@end

@implementation Summer

+ (NSInteger)sumOf:(NSInteger)first, ... {
    // Terminated by a sentinel of 0 passed as the last value.
    va_list args;
    va_start(args, first);
    NSInteger total = 0;
    for (NSInteger n = first; n != 0; n = va_arg(args, NSInteger)) {
        total += n;
    }
    va_end(args);
    return total;
}

+ (NSArray *)arrayWithObjectsNilTerminated:(id)first, ... {
    NSMutableArray *result = [NSMutableArray array];
    va_list args;
    va_start(args, first);
    for (id obj = first; obj != nil; obj = va_arg(args, id)) {
        [result addObject:obj];
    }
    va_end(args);
    return result;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)[Summer sumOf:1, 2, 3, 4, 0]);
        NSLog(@"%@", [Summer arrayWithObjectsNilTerminated:@"a", @"b", @"c", nil]);
    }
    return 0;
}
