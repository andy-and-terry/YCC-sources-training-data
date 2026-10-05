#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *obj = @{ @"name": @"widget", @"tags": @[ @"a", @"b" ], @"price": @9.5 };
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:NSJSONWritingSortedKeys
                                                         error:&error];
        if (!data) {
            NSLog(@"encode failed: %@", error);
            return 1;
        }
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", json);

        id parsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSLog(@"name=%@ tags=%lu", parsed[@"name"], (unsigned long)[parsed[@"tags"] count]);
    }
    return 0;
}
