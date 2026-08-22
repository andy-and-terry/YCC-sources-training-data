#import <Foundation/Foundation.h>

NSArray *fibonacci(int n) {
    NSMutableArray *result = [NSMutableArray array];
    long a = 0, b = 1;
    for (int i = 0; i < n; i++) {
        [result addObject:@(a)];
        long temp = a + b;
        a = b;
        b = temp;
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", fibonacci(11));
    }
    return 0;
}
