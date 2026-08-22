#import <Foundation/Foundation.h>

@protocol Greetable <NSObject>
- (NSString *)greet;
@end

@interface Person : NSObject <Greetable>
@property(nonatomic, copy) NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end

@implementation Person
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (NSString *)greet {
    return [NSString stringWithFormat:@"Hello, %@!", self.name];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] initWithName:@"Ada"];
        NSLog(@"%@", [p greet]);
    }
    return 0;
}
