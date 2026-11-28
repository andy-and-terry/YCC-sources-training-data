#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = @"banana$";
        NSMutableArray<NSString *> *rots = [NSMutableArray array];
        for (NSUInteger i = 0; i < s.length; i++)
            [rots addObject:[[s substringFromIndex:i] stringByAppendingString:[s substringToIndex:i]]];
        [rots sortUsingSelector:@selector(compare:)];
        NSMutableString *out = [NSMutableString string];
        for (NSString *r in rots) [out appendFormat:@"%C", [r characterAtIndex:r.length - 1]];
        NSLog(@"%@", out);
    }
    return 0;
}
