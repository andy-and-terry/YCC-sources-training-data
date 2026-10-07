#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *doc = @{
            @"name" : @"sensor-1",
            @"readings" : @[ @21.5, @22.0, @19.75 ],
            @"active" : @YES,
        };

        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:doc
                                                       options:NSJSONWritingSortedKeys
                                                         error:&error];
        NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", text);

        id parsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *readings = parsed[@"readings"];
        NSLog(@"count=%lu first=%@", (unsigned long)readings.count, readings.firstObject);

        NSData *bad = [@"{not json" dataUsingEncoding:NSUTF8StringEncoding];
        if (![NSJSONSerialization JSONObjectWithData:bad options:0 error:&error]) {
            NSLog(@"parse failed (code %ld)", (long)error.code);
        }
    }
    return 0;
}
