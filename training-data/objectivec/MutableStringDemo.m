#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableString *s = [NSMutableString stringWithString:@"Hello"];
        [s appendString:@", World"];
        [s insertString:@">> " atIndex:0];
        [s replaceOccurrencesOfString:@"World" withString:@"ObjC" options:0 range:NSMakeRange(0, s.length)];
        [s deleteCharactersInRange:NSMakeRange(0, 3)];
        NSLog(@"%@ (%lu chars)", s, (unsigned long)s.length);
        NSLog(@"%@", [s uppercaseString]);
    }
    return 0;
}
