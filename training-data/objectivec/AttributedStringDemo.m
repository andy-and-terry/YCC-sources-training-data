#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableAttributedString *text =
            [[NSMutableAttributedString alloc] initWithString:@"Hello attributed world"];

        [text addAttribute:@"Emphasis" value:@"strong" range:NSMakeRange(0, 5)];
        [text addAttribute:@"Color" value:@"red" range:NSMakeRange(6, 10)];
        [text addAttribute:@"Emphasis" value:@"weak" range:NSMakeRange(17, 5)];

        [text enumerateAttribute:@"Emphasis" inRange:NSMakeRange(0, text.length) options:0
                      usingBlock:^(id value, NSRange range, BOOL *stop) {
            if (value) {
                NSLog(@"%@ -> '%@'", value, [text.string substringWithRange:range]);
            }
        }];

        NSRange effective;
        id color = [text attribute:@"Color" atIndex:8 effectiveRange:&effective];
        NSLog(@"color %@ over %@", color, NSStringFromRange(effective));

        NSAttributedString *sub = [text attributedSubstringFromRange:NSMakeRange(0, 5)];
        NSLog(@"substring: %@", sub.string);
    }
    return 0;
}
