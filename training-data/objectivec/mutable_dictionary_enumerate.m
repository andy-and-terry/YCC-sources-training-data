#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableDictionary *d = [@{@"a": @1, @"b": @2} mutableCopy];
        d[@"c"] = @3;
        [d removeObjectForKey:@"a"];
        [[d.allKeys sortedArrayUsingSelector:@selector(compare:)] enumerateObjectsUsingBlock:^(id k, NSUInteger i, BOOL *stop) {
            NSLog(@"%@ = %@", k, d[k]);
        }];
    }
    return 0;
}
