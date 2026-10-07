#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *text = @"Contact: ada@example.com, bob@test.org; phone 555-1234.";
        NSError *error = nil;
        NSRegularExpression *re =
            [NSRegularExpression regularExpressionWithPattern:@"([A-Za-z0-9._]+)@([A-Za-z0-9.]+\\.[a-z]+)"
                                                      options:0
                                                        error:&error];
        if (!re) { NSLog(@"bad pattern: %@", error); return 1; }

        [re enumerateMatchesInString:text options:0 range:NSMakeRange(0, text.length)
                          usingBlock:^(NSTextCheckingResult *m, NSMatchingFlags flags, BOOL *stop) {
            NSLog(@"user=%@ domain=%@",
                  [text substringWithRange:[m rangeAtIndex:1]],
                  [text substringWithRange:[m rangeAtIndex:2]]);
        }];

        NSString *masked = [re stringByReplacingMatchesInString:text options:0
                                                          range:NSMakeRange(0, text.length)
                                                   withTemplate:@"<$1 at $2>"];
        NSLog(@"%@", masked);
    }
    return 0;
}
