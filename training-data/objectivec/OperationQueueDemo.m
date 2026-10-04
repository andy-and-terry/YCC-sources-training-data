#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        queue.maxConcurrentOperationCount = 1; // serial for deterministic output

        NSBlockOperation *load = [NSBlockOperation blockOperationWithBlock:^{ NSLog(@"load data"); }];
        NSBlockOperation *parse = [NSBlockOperation blockOperationWithBlock:^{ NSLog(@"parse data"); }];
        NSBlockOperation *report = [NSBlockOperation blockOperationWithBlock:^{ NSLog(@"report results"); }];

        // dependencies decide the order regardless of how they are added
        [report addDependency:parse];
        [parse addDependency:load];

        [queue addOperations:@[ report, parse, load ] waitUntilFinished:YES];
        NSLog(@"all done, operations left: %lu", (unsigned long)queue.operationCount);
    }
    return 0;
}
