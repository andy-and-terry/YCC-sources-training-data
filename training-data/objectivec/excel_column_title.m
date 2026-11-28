#import <Foundation/Foundation.h>

static NSString *columnTitle(NSInteger n) {
    NSMutableString *title = [NSMutableString string];
    while (n > 0) {
        n--;
        [title insertString:[NSString stringWithFormat:@"%c", (char)('A' + n % 26)] atIndex:0];
        n /= 26;
    }
    return title;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@ %@", columnTitle(28), columnTitle(701)); // AB ZY
    }
    return 0;
}
