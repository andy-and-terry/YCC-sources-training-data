#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *defaults = @{@"host": @"localhost", @"port": @80, @"debug": @NO};
        NSDictionary *overrides = @{@"port": @8080, @"debug": @YES};

        NSMutableDictionary *config = [defaults mutableCopy];
        [config addEntriesFromDictionary:overrides];

        for (NSString *key in [config.allKeys sortedArrayUsingSelector:@selector(compare:)]) {
            NSLog(@"%@ = %@", key, config[key]);
        }

        [config removeObjectForKey:@"debug"];
        config[@"timeout"] = @30;
        NSLog(@"keys: %@", [config.allKeys sortedArrayUsingSelector:@selector(compare:)]);

        id missing = config[@"nope"];
        NSLog(@"missing is nil: %d", missing == nil);
        NSLog(@"with default: %@", config[@"nope"] ?: @"fallback");
    }
    return 0;
}
