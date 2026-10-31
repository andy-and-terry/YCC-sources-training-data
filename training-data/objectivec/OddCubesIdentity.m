#import <Foundation/Foundation.h>

long cubeFromOdds(long n) {
    long start = n * n - n + 1, sum = 0;
    for (long i = 0; i < n; i++) sum += start + 2 * i;
    return sum;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (long n = 1; n <= 5; n++) {
            NSLog(@"%ld %ld %d", n, cubeFromOdds(n), cubeFromOdds(n) == n * n * n);
        }
    }
    return 0;
}
