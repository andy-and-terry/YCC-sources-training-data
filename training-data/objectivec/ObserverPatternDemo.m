#import <Foundation/Foundation.h>

@protocol StockObserver <NSObject>
- (void)priceDidChange:(double)newPrice forSymbol:(NSString *)symbol;
@end

@interface StockTicker : NSObject
@property (nonatomic, strong) NSMutableArray<id<StockObserver>> *observers;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic) double price;
- (void)addObserver:(id<StockObserver>)observer;
- (void)removeObserver:(id<StockObserver>)observer;
- (void)updatePrice:(double)newPrice;
@end

@implementation StockTicker

- (instancetype)initWithSymbol:(NSString *)symbol {
    self = [super init];
    if (self) {
        _symbol = symbol;
        _observers = [NSMutableArray array];
    }
    return self;
}

- (void)addObserver:(id<StockObserver>)observer {
    [self.observers addObject:observer];
}

- (void)removeObserver:(id<StockObserver>)observer {
    [self.observers removeObject:observer];
}

- (void)updatePrice:(double)newPrice {
    self.price = newPrice;
    for (id<StockObserver> observer in self.observers) {
        [observer priceDidChange:newPrice forSymbol:self.symbol];
    }
}

@end

@interface PriceLogger : NSObject <StockObserver>
@end

@implementation PriceLogger
- (void)priceDidChange:(double)newPrice forSymbol:(NSString *)symbol {
    NSLog(@"logger: %@ is now %.2f", symbol, newPrice);
}
@end

@interface PriceAlert : NSObject <StockObserver>
@property (nonatomic) double threshold;
@end

@implementation PriceAlert
- (void)priceDidChange:(double)newPrice forSymbol:(NSString *)symbol {
    if (newPrice > self.threshold) {
        NSLog(@"alert: %@ crossed threshold at %.2f", symbol, newPrice);
    }
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        StockTicker *ticker = [[StockTicker alloc] initWithSymbol:@"ACME"];

        PriceLogger *logger = [[PriceLogger alloc] init];
        PriceAlert *alert = [[PriceAlert alloc] init];
        alert.threshold = 100.0;

        [ticker addObserver:logger];
        [ticker addObserver:alert];

        [ticker updatePrice:95.0];
        [ticker updatePrice:105.0];

        [ticker removeObserver:logger];
        [ticker updatePrice:110.0];
    }
    return 0;
}
