#import <Foundation/Foundation.h>

@interface P : NSObject
@property NSString *name;
@property NSInteger age;
@end
@implementation P @end

int main(void) {
    @autoreleasepool {
        P *p = [P new];
        [p setValue:@"Ann" forKey:@"name"];
        [p setValue:@30 forKey:@"age"];
        NSLog(@"%@ %@", [p valueForKey:@"name"], [p valueForKey:@"age"]);
    }
    return 0;
}
