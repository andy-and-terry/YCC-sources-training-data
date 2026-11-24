#import <Foundation/Foundation.h>

// Moser-de Bruijn sequence: binary digits of n read in base 4.
static unsigned moser(unsigned n) {
    unsigned result = 0, place = 1;
    for (; n; n >>= 1, place *= 4)
        if (n & 1) result += place;
    return result;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (unsigned n = 0; n < 12; n++) [out addObject:@(moser(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
