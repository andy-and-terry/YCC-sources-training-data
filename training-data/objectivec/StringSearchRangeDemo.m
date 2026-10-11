#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *text = @"the quick brown fox jumps over the lazy dog";

        NSRange first = [text rangeOfString:@"the"];
        NSLog(@"first: %@", NSStringFromRange(first));

        NSRange last = [text rangeOfString:@"the" options:NSBackwardsSearch];
        NSLog(@"last: %@", NSStringFromRange(last));

        NSRange missing = [text rangeOfString:@"cat"];
        NSLog(@"found cat: %d", missing.location != NSNotFound);

        NSRange rest = NSMakeRange(first.location + first.length, text.length - first.length);
        NSRange second = [text rangeOfString:@"the" options:0 range:rest];
        NSLog(@"second: %@", NSStringFromRange(second));

        NSLog(@"contains fox: %d", [text containsString:@"fox"]);
        NSLog(@"substring: %@", [text substringWithRange:NSMakeRange(4, 5)]);
    }
    return 0;
}
