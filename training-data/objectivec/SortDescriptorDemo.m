#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@end
@implementation Person
@end

static Person *make(NSString *n, NSInteger a) {
    Person *p = [Person new];
    p.name = n;
    p.age = a;
    return p;
}

int main(void) {
    @autoreleasepool {
        NSArray *people = @[ make(@"Bob", 30), make(@"Amy", 25), make(@"Cat", 30) ];
        NSSortDescriptor *byAge = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
        NSSortDescriptor *byName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        for (Person *p in [people sortedArrayUsingDescriptors:@[ byAge, byName ]]) {
            NSLog(@"%@ %ld", p.name, (long)p.age);
        }
    }
    return 0;
}
