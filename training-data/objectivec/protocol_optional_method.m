#import <Foundation/Foundation.h>
@protocol Speaker <NSObject>
- (NSString *)name;
@optional
- (NSString *)nickname;
@end
@interface Dog : NSObject <Speaker> @end
@implementation Dog
- (NSString *)name { return @"Rex"; }
@end
int main() {
    @autoreleasepool {
        id<Speaker> s = [Dog new];
        NSLog(@"%@ %d", [s name], [s respondsToSelector:@selector(nickname)]);
    }
}
