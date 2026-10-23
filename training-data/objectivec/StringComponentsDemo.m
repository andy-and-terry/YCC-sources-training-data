#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *csv = @"red,green,blue";
        NSArray *parts = [csv componentsSeparatedByString:@","];
        NSLog(@"%@", parts);
        NSLog(@"%@", [parts componentsJoinedByString:@" | "]);
        NSLog(@"%@", [@"  padded  " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);
        NSRange r = [csv rangeOfString:@"green"];
        NSLog(@"%lu %lu", (unsigned long)r.location, (unsigned long)r.length);
        NSLog(@"%@", [csv stringByReplacingOccurrencesOfString:@"," withString:@";"]);
        NSLog(@"%@", [csv uppercaseString]);
    }
    return 0;
}
