#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *words = @[ @"apple", @"banana", @"avocado", @"cherry", @"apricot" ];

        NSPredicate *startsWithA = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"a"];
        NSLog(@"%@", [words filteredArrayUsingPredicate:startsWithA]);

        NSPredicate *longWords = [NSPredicate predicateWithBlock:^BOOL(NSString *w, NSDictionary *bindings) {
            return w.length > 6;
        }];
        NSLog(@"%@", [words filteredArrayUsingPredicate:longWords]);

        NSArray *numbers = @[ @3, @8, @12, @5 ];
        NSPredicate *big = [NSPredicate predicateWithFormat:@"SELF > %d", 4];
        NSLog(@"%@", [numbers filteredArrayUsingPredicate:big]);
    }
    return 0;
}
