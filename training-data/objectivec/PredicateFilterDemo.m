#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
+ (instancetype)personWithName:(NSString *)name age:(NSInteger)age;
@end

@implementation Person
+ (instancetype)personWithName:(NSString *)name age:(NSInteger)age {
    Person *p = [[Person alloc] init];
    p.name = name;
    p.age = age;
    return p;
}
- (NSString *)description { return [NSString stringWithFormat:@"%@(%ld)", self.name, (long)self.age]; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<Person *> *people = @[
            [Person personWithName:@"Ada" age:36],
            [Person personWithName:@"Bob" age:17],
            [Person personWithName:@"Cleo" age:52],
            [Person personWithName:@"Alan" age:41],
        ];

        NSPredicate *adults = [NSPredicate predicateWithFormat:@"age >= %d", 18];
        NSPredicate *startsWithA = [NSPredicate predicateWithFormat:@"name BEGINSWITH %@", @"A"];
        NSPredicate *both = [NSCompoundPredicate andPredicateWithSubpredicates:@[ adults, startsWithA ]];

        NSLog(@"adults: %@", [people filteredArrayUsingPredicate:adults]);
        NSLog(@"A names: %@", [people filteredArrayUsingPredicate:startsWithA]);
        NSLog(@"both: %@", [people filteredArrayUsingPredicate:both]);
        NSLog(@"average age: %@", [people valueForKeyPath:@"@avg.age"]);
    }
    return 0;
}
