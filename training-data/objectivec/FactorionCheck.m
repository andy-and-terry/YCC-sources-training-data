#import <Foundation/Foundation.h>

static const int FACT[10] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};

BOOL isFactorion(int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) sum += FACT[m % 10];
    return sum == n;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *found = [NSMutableArray array];
        for (int n = 1; n < 50000; n++) {
            if (isFactorion(n)) [found addObject:@(n)];
        }
        NSLog(@"%@", [found componentsJoinedByString:@" "]);
    }
    return 0;
}
