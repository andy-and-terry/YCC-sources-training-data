#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray<NSString *> *words = @[ @"apple", @"banana", @"avocado", @"cherry" ];
        NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"a"];
        NSLog(@"%@", [words filteredArrayUsingPredicate:p]);
        NSPredicate *len = [NSPredicate predicateWithBlock:^BOOL(NSString *s, NSDictionary *b) {
            return s.length > 5;
        }];
        NSLog(@"%@", [words filteredArrayUsingPredicate:len]);
    }
    return 0;
}
