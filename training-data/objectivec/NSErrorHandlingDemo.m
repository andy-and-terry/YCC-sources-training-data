#import <Foundation/Foundation.h>

static NSString *const ParseErrorDomain = @"com.example.ParseError";

typedef NS_ENUM(NSInteger, ParseErrorCode) {
    ParseErrorCodeEmptyInput = 1,
    ParseErrorCodeNotANumber = 2,
};

BOOL parseInteger(NSString *text, NSInteger *outValue, NSError **error) {
    if (text.length == 0) {
        if (error) {
            *error = [NSError errorWithDomain:ParseErrorDomain
                                          code:ParseErrorCodeEmptyInput
                                      userInfo:@{NSLocalizedDescriptionKey: @"input is empty"}];
        }
        return NO;
    }
    NSScanner *scanner = [NSScanner scannerWithString:text];
    NSInteger value;
    if (![scanner scanInteger:&value] || !scanner.isAtEnd) {
        if (error) {
            *error = [NSError errorWithDomain:ParseErrorDomain
                                          code:ParseErrorCodeNotANumber
                                      userInfo:@{NSLocalizedDescriptionKey: [NSString stringWithFormat:@"'%@' is not a number", text]}];
        }
        return NO;
    }
    if (outValue) *outValue = value;
    return YES;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (NSString *input in @[ @"42", @"", @"abc" ]) {
            NSInteger value = 0;
            NSError *error = nil;
            if (parseInteger(input, &value, &error)) {
                NSLog(@"parsed: %ld", (long)value);
            } else {
                NSLog(@"error: %@", error.localizedDescription);
            }
        }
    }
    return 0;
}
