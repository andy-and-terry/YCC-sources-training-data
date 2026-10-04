#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *doc = @{
            @"name": @"widget",
            @"tags": @[ @"a", @"b" ],
            @"price": @9.5,
            @"stock": @{ @"warehouse": @12, @"store": @3 },
        };

        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:doc
                                                       options:NSJSONWritingSortedKeys
                                                         error:&error];
        if (!data) { NSLog(@"encode failed: %@", error); return 1; }
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", json);

        id parsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSLog(@"tags count: %lu", (unsigned long)[parsed[@"tags"] count]);
        NSLog(@"warehouse: %@", parsed[@"stock"][@"warehouse"]);

        NSData *bad = [@"{not json" dataUsingEncoding:NSUTF8StringEncoding];
        if (![NSJSONSerialization JSONObjectWithData:bad options:0 error:&error]) {
            NSLog(@"parse error code: %ld", (long)error.code);
        }
    }
    return 0;
}
