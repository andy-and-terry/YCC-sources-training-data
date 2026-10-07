#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary *obj = @{ @"name": @"Ada", @"langs": @[ @"ObjC", @"C" ], @"age": @36 };
        NSError *err = nil;
        NSData *json = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:NSJSONWritingSortedKeys
                                                         error:&err];
        NSLog(@"%@", [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding]);
        NSDictionary *parsed = [NSJSONSerialization JSONObjectWithData:json options:0 error:&err];
        NSLog(@"%@", parsed[@"langs"][0]);
    }
    return 0;
}
