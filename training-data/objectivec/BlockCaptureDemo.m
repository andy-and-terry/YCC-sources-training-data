#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        int value = 10;
        void (^byValue)(void) = ^{ NSLog(@"captured value: %d", value); };
        value = 20;
        byValue();

        __block int shared = 10;
        void (^byRef)(void) = ^{ shared++; NSLog(@"__block value: %d", shared); };
        shared = 50;
        byRef();
        byRef();
        NSLog(@"outside sees: %d", shared);

        NSMutableArray *list = [NSMutableArray array];
        void (^append)(NSString *) = ^(NSString *s) { [list addObject:s]; };
        append(@"a");
        append(@"b");
        NSLog(@"mutated through pointer: %@", list);
    }
    return 0;
}
