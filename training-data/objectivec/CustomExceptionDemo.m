#import <Foundation/Foundation.h>

NSInteger withdraw(NSInteger balance, NSInteger amount) {
    if (amount > balance) {
        @throw [NSException exceptionWithName:@"InsufficientFundsException"
                                        reason:[NSString stringWithFormat:@"Cannot withdraw %ld, balance is %ld", (long)amount, (long)balance]
                                      userInfo:nil];
    }
    return balance - amount;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        @try {
            withdraw(100, 200);
        } @catch (NSException *exception) {
            NSLog(@"Caught: %@", exception.reason);
        }
        NSLog(@"%ld", (long)withdraw(100, 50));
    }
    return 0;
}
