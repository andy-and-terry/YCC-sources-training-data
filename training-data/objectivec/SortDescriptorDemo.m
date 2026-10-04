#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;
+ (instancetype)personWithName:(NSString *)name age:(NSInteger)age;
@end

@implementation Person
+ (instancetype)personWithName:(NSString *)name age:(NSInteger)age {
    Person *p = [[Person alloc] init];
    p.name = name;
    p.age = age;
    return p;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<Person *> *people = @[
            [Person personWithName:@"Zoe" age:30],
            [Person personWithName:@"Adam" age:25],
            [Person personWithName:@"Bea" age:30],
        ];
        NSArray *descriptors = @[
            [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO],
            [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],
        ];
        for (Person *p in [people sortedArrayUsingDescriptors:descriptors]) {
            NSLog(@"%@ (%ld)", p.name, (long)p.age);
        }
    }
    return 0;
}
