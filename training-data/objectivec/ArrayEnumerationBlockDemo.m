#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *words = @[ @"alpha", @"beta", @"gamma", @"delta" ];
        [words enumerateObjectsUsingBlock:^(NSString *w, NSUInteger idx, BOOL *stop) {
            NSLog(@"%lu: %@", (unsigned long)idx, w);
            if ([w hasPrefix:@"g"]) {
                *stop = YES;
            }
        }];
        NSIndexSet *longOnes = [words indexesOfObjectsPassingTest:^BOOL(NSString *w, NSUInteger idx, BOOL *stop) {
            return w.length > 4;
        }];
        NSLog(@"long words: %@", [words objectsAtIndexes:longOnes]);
    }
    return 0;
}
