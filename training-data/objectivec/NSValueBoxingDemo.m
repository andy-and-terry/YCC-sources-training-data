#import <Foundation/Foundation.h>

typedef struct {
    int x;
    int y;
} GridPoint;

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        GridPoint p = {3, 4};
        NSValue *boxed = [NSValue valueWithBytes:&p objCType:@encode(GridPoint)];

        GridPoint out;
        [boxed getValue:&out];
        NSLog(@"unboxed: (%d, %d)", out.x, out.y);

        NSValue *range = [NSValue valueWithRange:NSMakeRange(2, 5)];
        NSLog(@"range: %@", NSStringFromRange(range.rangeValue));

        NSArray *values = @[boxed, [NSValue valueWithPointer:NULL]];
        NSLog(@"stored %lu boxed values", (unsigned long)values.count);
        NSLog(@"type encoding: %s", boxed.objCType);
    }
    return 0;
}
