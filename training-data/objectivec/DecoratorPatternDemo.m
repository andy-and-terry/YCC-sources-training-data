#import <Foundation/Foundation.h>

@protocol Beverage <NSObject>
- (double)cost;
- (NSString *)description;
@end

@interface Coffee : NSObject <Beverage>
@end
@implementation Coffee
- (double)cost { return 2.0; }
- (NSString *)description { return @"Coffee"; }
@end

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

@interface MilkDecorator : BeverageDecorator
@end
@implementation MilkDecorator
- (double)cost { return [super cost] + 0.5; }
- (NSString *)description { return [[super description] stringByAppendingString:@" + Milk"]; }
@end

@interface SugarDecorator : BeverageDecorator
@end
@implementation SugarDecorator
- (double)cost { return [super cost] + 0.25; }
- (NSString *)description { return [[super description] stringByAppendingString:@" + Sugar"]; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        id<Beverage> drink = [[Coffee alloc] init];
        drink = [[MilkDecorator alloc] initWithBeverage:drink];
        drink = [[SugarDecorator alloc] initWithBeverage:drink];
        NSLog(@"%@ = %.2f", [drink description], [drink cost]);
    }
    return 0;
}
