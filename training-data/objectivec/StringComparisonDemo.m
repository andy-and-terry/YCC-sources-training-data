#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *a = @"apple";
        NSString *b = @"Apple";

        NSLog(@"isEqualToString: %d", [a isEqualToString:b]);
        NSLog(@"compare: %ld", (long)[a compare:b]);
        NSLog(@"caseInsensitive: %ld", (long)[a compare:b options:NSCaseInsensitiveSearch]);
        NSLog(@"caseInsensitiveCompare: %ld", (long)[a caseInsensitiveCompare:b]);

        NSString *v1 = @"file10.txt";
        NSString *v2 = @"file9.txt";
        NSLog(@"literal: %ld", (long)[v1 compare:v2]);
        NSLog(@"numeric: %ld", (long)[v1 compare:v2 options:NSNumericSearch]);

        NSLog(@"hasPrefix: %d hasSuffix: %d", [v1 hasPrefix:@"file"], [v1 hasSuffix:@".md"]);
    }
    return 0;
}
