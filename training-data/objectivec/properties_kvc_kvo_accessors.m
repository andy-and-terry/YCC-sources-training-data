#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, readonly) NSString *label;
@end

@implementation Person
- (NSString *)label { return [NSString stringWithFormat:@"%@ (%ld)", self.name, (long)self.age]; }
@end

int main(void) {
    @autoreleasepool {
        Person *p = [Person new];
        [p setValue:@"Ada" forKey:@"name"];
        [p setValue:@36 forKey:@"age"];
        NSLog(@"%@ %@", p.label, [p valueForKey:@"age"]);
        NSArray *people = @[p];
        NSLog(@"%@", [people valueForKeyPath:@"name"]);
        NSLog(@"%@", [@[@1, @2, @3] valueForKeyPath:@"@sum.self"]);
        NSLog(@"%@", [@[@1, @5, @3] valueForKeyPath:@"@max.self"]);
    }
    return 0;
}
