#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end
@implementation Person
@end

int main(void) {
    @autoreleasepool {
        Person *p = [Person new];
        [p setValue:@"Ann" forKey:@"name"];
        [p setValue:@31 forKey:@"age"];
        NSLog(@"%@ %ld", p.name, (long)p.age);
    }
    return 0;
}
