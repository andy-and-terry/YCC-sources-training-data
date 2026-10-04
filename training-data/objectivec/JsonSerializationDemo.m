#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *obj = @{ @"name": @"Widget", @"tags": @[ @"a", @"b" ], @"price": @9.5 };
        NSError *err = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:NSJSONWritingSortedKeys
                                                         error:&err];
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", json);

        id back = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        NSLog(@"name=%@ tags=%lu", back[@"name"], (unsigned long)[back[@"tags"] count]);
    }
    return 0;
}
