#import <Foundation/Foundation.h>

@protocol Greeter <NSObject>
- (NSString *)greet:(NSString *)name;
@end

@interface Polite : NSObject <Greeter>
@end
@implementation Polite
- (NSString *)greet:(NSString *)name { return [NSString stringWithFormat:@"Good day, %@", name]; }
@end

int main(void) {
    @autoreleasepool {
        id<Greeter> g = [Polite new];
        NSLog(@"%@", [g greet:@"Ann"]);
    }
    return 0;
}
