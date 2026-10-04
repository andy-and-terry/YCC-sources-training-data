#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *items = @[ @"one", @"two", @"three", @"four" ];
        [items enumerateObjectsUsingBlock:^(NSString *s, NSUInteger idx, BOOL *stop) {
            NSLog(@"%lu: %@", (unsigned long)idx, s);
            if ([s isEqualToString:@"three"]) *stop = YES;
        }];
        [items enumerateObjectsWithOptions:NSEnumerationReverse
                                usingBlock:^(NSString *s, NSUInteger idx, BOOL *stop) {
            NSLog(@"reverse %@", s);
        }];
    }
    return 0;
}
