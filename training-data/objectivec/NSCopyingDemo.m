#import <Foundation/Foundation.h>

@interface Money : NSObject <NSCopying>
@property (nonatomic) NSInteger cents;
- (instancetype)initWithCents:(NSInteger)cents;
@end

@implementation Money
- (instancetype)initWithCents:(NSInteger)cents {
    self = [super init];
    if (self) _cents = cents;
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[Money allocWithZone:zone] initWithCents:self.cents];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"$%.2f", self.cents / 100.0];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Money *original = [[Money alloc] initWithCents:1050];
        Money *copy = [original copy];
        copy.cents = 500;
        NSLog(@"original: %@", original);
        NSLog(@"copy: %@", copy);
        NSLog(@"same instance: %@", (original == copy) ? @"YES" : @"NO");
    }
    return 0;
}
