#import <Foundation/Foundation.h>

static void hanoi(int n, char a, char b, char c, NSMutableArray *out) {
    if (n == 0) return;
    hanoi(n - 1, a, c, b, out);
    [out addObject:[NSString stringWithFormat:@"%c->%c", a, c]];
    hanoi(n - 1, b, a, c, out);
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *moves = [NSMutableArray array];
        hanoi(3, 'A', 'B', 'C', moves);
        NSLog(@"%lu: %@", (unsigned long)moves.count, [moves componentsJoinedByString:@" "]);
    }
    return 0;
}
