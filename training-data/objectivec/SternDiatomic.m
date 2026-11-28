#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *seq = [@[@0, @1] mutableCopy];
        for (NSInteger i = 2; i < 15; i++) {
            NSInteger h = i / 2;
            NSInteger v = (i % 2 == 0) ? seq[h].integerValue
                                       : seq[h].integerValue + seq[h + 1].integerValue;
            [seq addObject:@(v)];
        }
        NSLog(@"%@", [seq componentsJoinedByString:@" "]); // 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
    }
    return 0;
}
