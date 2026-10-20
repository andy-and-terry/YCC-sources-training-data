#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary *obj = @{@"name": @"Ada", @"tags": @[@"a", @"b"], @"n": @{@"x": @1.5}};
        NSError *err = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingSortedKeys error:&err];
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", json);
        id back = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        NSLog(@"%@ %lu", back[@"name"], (unsigned long)[back[@"tags"] count]);
        NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"demo.txt"];
        [@"line1\nline2" writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&err];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
        NSLog(@"%lu lines", (unsigned long)[content componentsSeparatedByString:@"\n"].count);
        NSLog(@"%d", [[NSFileManager defaultManager] fileExistsAtPath:path]);
        [[NSFileManager defaultManager] removeItemAtPath:path error:&err];
        NSLog(@"%d", [[NSFileManager defaultManager] fileExistsAtPath:path]);
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:[@"[bad" dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&err] ?: err.domain);
    }
    return 0;
}
