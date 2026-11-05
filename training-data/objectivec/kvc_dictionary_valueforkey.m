#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString *name;
@property NSInteger age;
@end
@implementation Person
@end

int main(void) {
    @autoreleasepool {
        Person *p = [Person new];
        [p setValue:@"Ann" forKey:@"name"];
        [p setValue:@30 forKey:@"age"];
        NSLog(@"%@ %@", [p valueForKey:@"name"], [p valueForKey:@"age"]);
        NSArray *a = @[@3, @1, @2];
        NSLog(@"%@ %@", [a valueForKeyPath:@"@max.self"], [a valueForKeyPath:@"@sum.self"]);
    }
    return 0;
}
