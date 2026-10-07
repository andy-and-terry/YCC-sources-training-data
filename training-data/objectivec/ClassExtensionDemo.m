#import <Foundation/Foundation.h>

@interface Counter : NSObject
- (void)increment;
- (NSInteger)value;
@end

// A class extension (a category with no name) declared in the same file
// as the implementation. It can add "private" properties and methods
// that are visible only within this file, unlike a regular named
// category, which cannot add instance variables at all.
@interface Counter ()
@property (nonatomic) NSInteger internalValue;
- (void)logChange;
@end

@implementation Counter
- (void)increment {
    self.internalValue += 1;
    [self logChange];
}

- (NSInteger)value {
    return self.internalValue;
}

- (void)logChange {
    NSLog(@"counter is now %ld", (long)self.internalValue);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Counter *c = [[Counter alloc] init];
        [c increment];
        [c increment];
        NSLog(@"final value: %ld", (long)[c value]);
    }
    return 0;
}
