#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary *d = @{@"a": @1, @"b": @2};
        [d enumerateKeysAndObjectsUsingBlock:^(id k, id v, BOOL *stop) {
            NSLog(@"%@=%@", k, v);
        }];
    }
    return 0;
}
