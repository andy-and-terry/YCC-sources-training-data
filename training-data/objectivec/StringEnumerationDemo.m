#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *text = @"First line.\nSecond line here.\nThird.";

        [text enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
            NSLog(@"line: '%@'", line);
        }];

        __block NSUInteger words = 0;
        [text enumerateSubstringsInRange:NSMakeRange(0, text.length)
                                 options:NSStringEnumerationByWords
                              usingBlock:^(NSString *w, NSRange r, NSRange er, BOOL *stop) {
            words++;
        }];
        NSLog(@"word count: %lu", (unsigned long)words);

        [@"héllo 👋" enumerateSubstringsInRange:NSMakeRange(0, 7)
                                       options:NSStringEnumerationByComposedCharacterSequences
                                    usingBlock:^(NSString *ch, NSRange r, NSRange er, BOOL *stop) {
            NSLog(@"char '%@' at %lu length %lu", ch, (unsigned long)r.location, (unsigned long)r.length);
        }];
    }
    return 0;
}
