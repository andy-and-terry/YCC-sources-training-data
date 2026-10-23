#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *suiteName = @"com.example.userdefaults.demo";
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:suiteName];
        [defaults removePersistentDomainForName:suiteName];

        // registered defaults are fallbacks; they are never written to disk
        [defaults registerDefaults:@{
            @"volume": @7,
            @"username": @"guest",
            @"darkMode": @NO
        }];

        NSLog(@"volume (default): %ld", (long)[defaults integerForKey:@"volume"]);
        NSLog(@"username (default): %@", [defaults stringForKey:@"username"]);

        [defaults setInteger:11 forKey:@"volume"];
        [defaults setBool:YES forKey:@"darkMode"];
        [defaults setObject:@[@"alpha", @"beta"] forKey:@"recent"];
        [defaults synchronize];

        NSLog(@"volume: %ld", (long)[defaults integerForKey:@"volume"]);
        NSLog(@"darkMode: %@", [defaults boolForKey:@"darkMode"] ? @"YES" : @"NO");
        NSLog(@"recent: %@", [defaults arrayForKey:@"recent"]);
        NSLog(@"missing key object: %@", [defaults objectForKey:@"nope"]);

        [defaults removeObjectForKey:@"volume"];
        NSLog(@"volume after remove (falls back): %ld", (long)[defaults integerForKey:@"volume"]);

        [defaults removePersistentDomainForName:suiteName];
    }
    return 0;
}
