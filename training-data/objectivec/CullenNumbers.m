#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (int n = 1; n <= 5; n++) {
            NSLog(@"%d %lld", n, (long long)n * (1LL << n) + 1);
        }
    }
    return 0;
}
