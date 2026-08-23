#import <Foundation/Foundation.h>

NSDictionary *wordFrequency(NSString *text) {
    NSMutableDictionary *freq = [NSMutableDictionary dictionary];
    NSArray *words = [text.lowercaseString componentsSeparatedByString:@" "];
    for (NSString *word in words) {
        NSNumber *count = freq[word];
        freq[word] = @(count.integerValue + 1);
    }
    return freq;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", wordFrequency(@"the quick brown fox the lazy fox"));
    }
    return 0;
}
