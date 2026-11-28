#import <Foundation/Foundation.h>

NSString *encrypt(NSString *text, int k) {
    int cycle = 2 * (k - 1);
    NSMutableArray<NSMutableString *> *rails = [NSMutableArray array];
    for (int r = 0; r < k; r++) [rails addObject:[NSMutableString string]];
    for (NSUInteger i = 0; i < text.length; i++) {
        int r = (int)(i % cycle);
        if (r >= k) r = cycle - r;
        [rails[r] appendFormat:@"%C", [text characterAtIndex:i]];
    }
    return [rails componentsJoinedByString:@""];
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", encrypt(@"WEAREDISCOVERED", 3));
    }
    return 0;
}
