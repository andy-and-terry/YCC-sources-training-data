#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSString *> *kept = [NSMutableArray array];

        for (int i = 0; i < 1000; i++) {
            // a nested pool drains temporaries on every iteration
            // instead of letting them pile up until the outer pool ends
            @autoreleasepool {
                NSString *tmp = [NSString stringWithFormat:@"item-%d", i];
                if (i % 250 == 0) {
                    [kept addObject:[tmp copy]];
                }
            }
        }
        NSLog(@"kept %lu strings: %@", (unsigned long)kept.count, kept);
    }
    return 0;
}
