#import <Foundation/Foundation.h>

// The strategy interface: any discount algorithm can be swapped in.
@protocol DiscountStrategy <NSObject>
- (double)applyTo:(double)price;
@end

@interface NoDiscount : NSObject <DiscountStrategy>
@end
@implementation NoDiscount
- (double)applyTo:(double)price { return price; }
@end

@interface PercentOffDiscount : NSObject <DiscountStrategy>
@property (nonatomic) double percent;
- (instancetype)initWithPercent:(double)percent;
@end
@implementation PercentOffDiscount
- (instancetype)initWithPercent:(double)percent {
    self = [super init];
    if (self) _percent = percent;
    return self;
}
- (double)applyTo:(double)price { return price - (price * self.percent / 100.0); }
@end

@interface Cart : NSObject
@property (nonatomic, strong) id<DiscountStrategy> discount;
- (double)checkout:(double)price;
@end
@implementation Cart
- (double)checkout:(double)price { return [self.discount applyTo:price]; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Cart *cart = [[Cart alloc] init];

        cart.discount = [[NoDiscount alloc] init];
        NSLog(@"%.2f", [cart checkout:100.0]);

        cart.discount = [[PercentOffDiscount alloc] initWithPercent:20.0];
        NSLog(@"%.2f", [cart checkout:100.0]);
    }
    return 0;
}
