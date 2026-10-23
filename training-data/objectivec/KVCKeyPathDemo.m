#import <Foundation/Foundation.h>

@interface Address : NSObject
@property NSString *city;
@end
@implementation Address
@end

@interface Person : NSObject
@property NSString *name;
@property Address *address;
@end
@implementation Person
@end

int main(void) {
  @autoreleasepool {
    Person *p = [Person new];
    p.address = [Address new];
    [p setValue:@"Ann" forKey:@"name"];
    [p setValue:@"Oslo" forKeyPath:@"address.city"];
    NSLog(@"%@ lives in %@", [p valueForKey:@"name"], [p valueForKeyPath:@"address.city"]);
    NSArray *nums = @[@1, @2, @3];
    NSLog(@"sum=%@ max=%@", [nums valueForKeyPath:@"@sum.self"], [nums valueForKeyPath:@"@max.self"]);
  }
  return 0;
}
