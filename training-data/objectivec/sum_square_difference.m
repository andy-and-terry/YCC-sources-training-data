// Square of the sum minus sum of squares for 1..10 (expect 2640)
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSInteger sum = 0, squares = 0;
        for (NSInteger i = 1; i <= 10; i++) { sum += i; squares += i * i; }
        NSLog(@"%ld", (long)(sum * sum - squares));
    }
    return 0;
}
