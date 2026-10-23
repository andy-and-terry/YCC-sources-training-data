#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p setValue:@"Ann" forKey:@"name"];
        [p setValue:@31 forKey:@"age"];
        NSLog(@"%@ %@", [p valueForKey:@"name"], [p valueForKey:@"age"]);

        NSArray *nums = @[@1, @2, @3, @4];
        NSLog(@"sum=%@ max=%@ avg=%@", [nums valueForKeyPath:@"@sum.self"],
              [nums valueForKeyPath:@"@max.self"], [nums valueForKeyPath:@"@avg.self"]);
    }
    return 0;
}
