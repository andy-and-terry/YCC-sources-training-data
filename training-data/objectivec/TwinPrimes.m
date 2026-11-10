#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        const int limit = 80;
        BOOL composite[81] = {NO};
        for (int i = 2; i * i <= limit; i++)
            if (!composite[i])
                for (int j = i * i; j <= limit; j += i) composite[j] = YES;
        NSMutableArray<NSString *> *pairs = [NSMutableArray array];
        for (int p = 3; p + 2 <= limit; p++)
            if (!composite[p] && !composite[p + 2]) [pairs addObject:[NSString stringWithFormat:@"(%d,%d)", p, p + 2]];
        NSLog(@"%@", [pairs componentsJoinedByString:@" "]); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
    }
    return 0;
}
