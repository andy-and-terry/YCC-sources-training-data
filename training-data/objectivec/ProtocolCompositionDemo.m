#import <Foundation/Foundation.h>

@protocol Named <NSObject>
- (NSString *)name;
@end

@protocol Aged <NSObject>
- (NSInteger)age;
@end

// A protocol can itself require conformance to other protocols. Anything
// that conforms to Describable must also satisfy Named and Aged.
@protocol Describable <Named, Aged>
- (NSString *)describe;
@end

@interface Person : NSObject <Describable>
@property (nonatomic, copy) NSString *personName;
@property (nonatomic) NSInteger personAge;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
@end

@implementation Person
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _personName = name;
        _personAge = age;
    }
    return self;
}

- (NSString *)name {
    return self.personName;
}

- (NSInteger)age {
    return self.personAge;
}

- (NSString *)describe {
    return [NSString stringWithFormat:@"%@ is %ld years old", [self name], (long)[self age]];
}
@end

void printDescription(id<Describable> thing) {
    NSLog(@"%@", [thing describe]);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] initWithName:@"Grace" age:36];
        printDescription(p);
    }
    return 0;
}
