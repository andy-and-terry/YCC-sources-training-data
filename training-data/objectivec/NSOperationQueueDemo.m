#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSOperationQueue *q = [NSOperationQueue new];
        q.maxConcurrentOperationCount = 1;
        NSBlockOperation *a = [NSBlockOperation blockOperationWithBlock:^{ NSLog(@"first"); }];
        NSBlockOperation *b = [NSBlockOperation blockOperationWithBlock:^{ NSLog(@"second"); }];
        [b addDependency:a];
        [q addOperations:@[ b, a ] waitUntilFinished:YES];
    }
    return 0;
}
