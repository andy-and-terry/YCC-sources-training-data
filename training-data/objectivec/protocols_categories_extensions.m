#import <Foundation/Foundation.h>

@protocol Describable <NSObject>
@required
- (NSString *)describe;
@optional
- (NSString *)nickname;
@end

@interface Dog : NSObject <Describable>
@property (nonatomic, copy) NSString *name;
@end

@implementation Dog
- (NSString *)describe { return [NSString stringWithFormat:@"Dog %@", self.name]; }
@end

@interface NSString (Shout)
- (NSString *)shout;
@end
@implementation NSString (Shout)
- (NSString *)shout { return [[self uppercaseString] stringByAppendingString:@"!"]; }
@end

int main(void) {
    @autoreleasepool {
        Dog *d = [Dog new];
        d.name = @"Rex";
        NSLog(@"%@ %d %d", [d describe], [d conformsToProtocol:@protocol(Describable)], [d respondsToSelector:@selector(nickname)]);
        NSLog(@"%@", [@"hello" shout]);
    }
    return 0;
}
