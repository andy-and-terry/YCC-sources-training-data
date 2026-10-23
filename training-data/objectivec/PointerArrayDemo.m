#import <Foundation/Foundation.h>

@interface Token : NSObject
@property (nonatomic, copy) NSString *text;
+ (instancetype)tokenWithText:(NSString *)text;
@end

@implementation Token
+ (instancetype)tokenWithText:(NSString *)text {
    Token *t = [[Token alloc] init];
    t.text = text;
    return t;
}
- (void)dealloc {
    NSLog(@"dealloc %@", _text);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        // weak pointer array: entries become NULL once the object dies
        NSPointerArray *weakArray = [NSPointerArray weakObjectsPointerArray];
        Token *keeper = [Token tokenWithText:@"keeper"];
        [weakArray addPointer:(__bridge void *)keeper];

        @autoreleasepool {
            Token *temp = [Token tokenWithText:@"temp"];
            [weakArray addPointer:(__bridge void *)temp];
            NSLog(@"count inside = %lu", (unsigned long)weakArray.count);
        }

        [weakArray addPointer:NULL];
        [weakArray compact];
        NSLog(@"count after compact = %lu", (unsigned long)weakArray.count);

        for (NSUInteger i = 0; i < weakArray.count; i++) {
            Token *t = (__bridge Token *)[weakArray pointerAtIndex:i];
            NSLog(@"slot %lu: %@", (unsigned long)i, t.text);
        }
        NSLog(@"keeper still alive: %@", keeper.text);
    }
    return 0;
}
