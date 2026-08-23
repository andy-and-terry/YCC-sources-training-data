#import <Foundation/Foundation.h>

void fizzbuzz(NSInteger n) {
    for (NSInteger i = 1; i <= n; i++) {
        if (i % 15 == 0) {
            NSLog(@"FizzBuzz");
        } else if (i % 3 == 0) {
            NSLog(@"Fizz");
        } else if (i % 5 == 0) {
            NSLog(@"Buzz");
        } else {
            NSLog(@"%ld", (long)i);
        }
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        fizzbuzz(20);
    }
    return 0;
}
