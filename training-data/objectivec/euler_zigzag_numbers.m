#import <Foundation/Foundation.h>

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
int main(void) {
    @autoreleasepool {
        NSArray<NSNumber *> *row = @[ @1 ];
        NSMutableArray<NSNumber *> *out = [NSMutableArray arrayWithObject:@1];
        for (int i = 0; i < 9; i++) {
            NSMutableArray<NSNumber *> *next = [NSMutableArray arrayWithObject:@0];
            for (NSNumber *x in [row reverseObjectEnumerator])
                [next addObject:@([[next lastObject] longLongValue] + [x longLongValue])];
            row = next;
            [out addObject:[row lastObject]];
        }
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
