#import <Foundation/Foundation.h>

// By default, two custom objects are only -isEqual: if they are the
// same instance (pointer equality), and their -hash is derived from
// that identity. To make a value type like Money behave correctly as
// a dictionary key or inside a set, both methods must be overridden
// together and stay consistent: equal objects must have equal hashes.
@interface Money : NSObject
@property (nonatomic) NSInteger cents;
@property (nonatomic, copy) NSString *currency;
- (instancetype)initWithCents:(NSInteger)cents currency:(NSString *)currency;
@end

@implementation Money
- (instancetype)initWithCents:(NSInteger)cents currency:(NSString *)currency {
    self = [super init];
    if (self) {
        _cents = cents;
        _currency = [currency copy];
    }
    return self;
}

- (BOOL)isEqual:(id)other {
    if (self == other) return YES;
    if (![other isKindOfClass:[Money class]]) return NO;
    Money *otherMoney = (Money *)other;
    return self.cents == otherMoney.cents && [self.currency isEqualToString:otherMoney.currency];
}

- (NSUInteger)hash {
    return (NSUInteger)self.cents ^ self.currency.hash;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%ld %@", (long)self.cents, self.currency];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Money *fiveDollarsA = [[Money alloc] initWithCents:500 currency:@"USD"];
        Money *fiveDollarsB = [[Money alloc] initWithCents:500 currency:@"USD"];
        Money *tenDollars = [[Money alloc] initWithCents:1000 currency:@"USD"];

        NSLog(@"same instance equal: %d", [fiveDollarsA isEqual:fiveDollarsA]);
        NSLog(@"distinct equal-value instances equal: %d", [fiveDollarsA isEqual:fiveDollarsB]);
        NSLog(@"different amounts equal: %d", [fiveDollarsA isEqual:tenDollars]);
        NSLog(@"equal hashes: %d", fiveDollarsA.hash == fiveDollarsB.hash);

        NSSet<Money *> *wallet = [NSSet setWithObjects:fiveDollarsA, fiveDollarsB, tenDollars, nil];
        NSLog(@"unique amounts in wallet: %lu", (unsigned long)wallet.count);
    }
    return 0;
}
