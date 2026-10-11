#import <Foundation/Foundation.h>

@interface Address : NSObject
@property (nonatomic, copy) NSString *city;
@end
@implementation Address
@end

@interface Employee : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Address *address;
@property (nonatomic, assign) double salary;
@end
@implementation Employee
@end

static Employee *make(NSString *name, NSString *city, double salary) {
    Employee *e = [Employee new];
    e.name = name;
    e.salary = salary;
    e.address = [Address new];
    e.address.city = city;
    return e;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<Employee *> *staff = @[make(@"Ann", @"Oslo", 5200), make(@"Bo", @"Rome", 4100),
                                       make(@"Cy", @"Oslo", 6000)];

        NSLog(@"first city: %@", [staff[0] valueForKeyPath:@"address.city"]);
        NSLog(@"all cities: %@", [staff valueForKeyPath:@"address.city"]);
        NSLog(@"unique cities: %@", [[staff valueForKeyPath:@"@distinctUnionOfObjects.address.city"]
                                       sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"max salary: %@", [staff valueForKeyPath:@"@max.salary"]);

        [staff[1] setValue:@"Milan" forKeyPath:@"address.city"];
        NSLog(@"updated: %@", staff[1].address.city);
    }
    return 0;
}
