#import <Foundation/Foundation.h>

@protocol DiscountStrategy <NSObject>
- (double)applyTo:(double)price;
@end

@interface NoDiscount : NSObject <DiscountStrategy>
@end
@implementation NoDiscount
- (double)applyTo:(double)price { return price; }
@end

@interface TenPercentOff : NSObject <DiscountStrategy>
@end
@implementation TenPercentOff
- (double)applyTo:(double)price { return price * 0.9; }
@end

@interface HalfOff : NSObject <DiscountStrategy>
@end
@implementation HalfOff
- (double)applyTo:(double)price { return price * 0.5; }
@end

@interface Checkout : NSObject
@property (nonatomic, strong) id<DiscountStrategy> strategy;
- (double)totalFor:(double)price;
@end

@implementation Checkout
- (double)totalFor:(double)price {
    return [self.strategy applyTo:price];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Checkout *checkout = [[Checkout alloc] init];
        NSArray<id<DiscountStrategy>> *strategies = @[ [[NoDiscount alloc] init], [[TenPercentOff alloc] init], [[HalfOff alloc] init] ];
        for (id<DiscountStrategy> strategy in strategies) {
            checkout.strategy = strategy;
            NSLog(@"%.2f", [checkout totalFor:100.0]);
        }
    }
    return 0;
}
