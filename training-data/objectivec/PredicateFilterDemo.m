#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *words = @[ @"apple", @"banana", @"avocado", @"cherry", @"apricot" ];
        NSPredicate *startsA = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH 'a'"];
        NSLog(@"%@", [words filteredArrayUsingPredicate:startsA]);

        NSPredicate *longWords = [NSPredicate predicateWithBlock:^BOOL(NSString *w, NSDictionary *b) {
            return w.length > 6;
        }];
        NSLog(@"%@", [words filteredArrayUsingPredicate:longWords]);
    }
    return 0;
}
