#import <Foundation/Foundation.h>

@protocol Beverage <NSObject>
- (double)cost;
- (NSString *)description;
@end

@interface Espresso : NSObject <Beverage>
@end

@implementation Espresso
- (double)cost { return 1.50; }
- (NSString *)description { return @"Espresso"; }
@end

// The decorator conforms to the same protocol as the object it wraps,
// so decorators can be stacked without the caller knowing how many
// layers deep the chain goes.
@interface BeverageDecorator : NSObject <Beverage>
@property (nonatomic, strong) id<Beverage> wrapped;
- (instancetype)initWithBeverage:(id<Beverage>)beverage;
@end

@implementation BeverageDecorator
- (instancetype)initWithBeverage:(id<Beverage>)beverage {
    self = [super init];
    if (self) _wrapped = beverage;
    return self;
}
- (double)cost { return self.wrapped.cost; }
- (NSString *)description { return self.wrapped.description; }
@end

@interface WithMilk : BeverageDecorator
@end

@implementation WithMilk
- (double)cost { return [super cost] + 0.40; }
- (NSString *)description { return [[super description] stringByAppendingString:@" + milk"]; }
@end

@interface WithCaramel : BeverageDecorator
@end

@implementation WithCaramel
- (double)cost { return [super cost] + 0.60; }
- (NSString *)description { return [[super description] stringByAppendingString:@" + caramel"]; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        id<Beverage> drink = [[Espresso alloc] init];
        drink = [[WithMilk alloc] initWithBeverage:drink];
        drink = [[WithCaramel alloc] initWithBeverage:drink];
        NSLog(@"%@ costs %.2f", [drink description], [drink cost]);
    }
    return 0;
}
