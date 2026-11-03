#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        int sum = 0;
        for (int n = 1; n <= 10; n++) {
            sum += n;
            [out addObject:@(sum)];
        }
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
