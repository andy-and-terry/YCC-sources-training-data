#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSURLComponents *parts = [NSURLComponents componentsWithString:
            @"https://user@example.com:8443/search/items?q=objc&page=2#results"];

        NSLog(@"scheme: %@", parts.scheme);
        NSLog(@"host: %@ port: %@", parts.host, parts.port);
        NSLog(@"path: %@", parts.path);
        NSLog(@"fragment: %@", parts.fragment);

        for (NSURLQueryItem *item in parts.queryItems) {
            NSLog(@"query %@ = %@", item.name, item.value);
        }

        NSURLComponents *build = [[NSURLComponents alloc] init];
        build.scheme = @"https";
        build.host = @"api.example.com";
        build.path = @"/v1/users";
        build.queryItems = @[[NSURLQueryItem queryItemWithName:@"name" value:@"a b&c"]];
        NSLog(@"built: %@", build.URL.absoluteString);
    }
    return 0;
}
