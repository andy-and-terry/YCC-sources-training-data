#import <Foundation/Foundation.h>

// s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2
NSInteger polygonal(NSInteger s, NSInteger n) {
    return ((s - 2) * n * n - (s - 4) * n) / 2;
}

NSArray<NSNumber *> *firstTen(NSInteger s) {
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger n = 1; n <= 10; n++) {
        [result addObject:@(polygonal(s, n))];
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"Triangular: %@", [firstTen(3) componentsJoinedByString:@" "]);
        NSLog(@"Pentagonal: %@", [firstTen(5) componentsJoinedByString:@" "]);
        NSLog(@"Hexagonal: %@", [firstTen(6) componentsJoinedByString:@" "]);
    }
    return 0;
}
