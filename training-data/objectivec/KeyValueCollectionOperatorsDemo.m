#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *nums = @[ @4, @8, @15, @16, @23, @42 ];
        NSLog(@"sum=%@", [nums valueForKeyPath:@"@sum.self"]);
        NSLog(@"avg=%@", [nums valueForKeyPath:@"@avg.self"]);
        NSLog(@"max=%@ min=%@", [nums valueForKeyPath:@"@max.self"], [nums valueForKeyPath:@"@min.self"]);
        NSLog(@"count=%@", [nums valueForKeyPath:@"@count"]);
    }
    return 0;
}
