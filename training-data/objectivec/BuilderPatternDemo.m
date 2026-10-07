#import <Foundation/Foundation.h>

@interface Pizza : NSObject
@property (nonatomic, copy) NSString *size;
@property (nonatomic, strong) NSMutableArray<NSString *> *toppings;
- (NSString *)describe;
@end

@implementation Pizza
- (instancetype)init {
    self = [super init];
    if (self) _toppings = [NSMutableArray array];
    return self;
}
- (NSString *)describe {
    return [NSString stringWithFormat:@"%@ pizza with %@", self.size,
            [self.toppings componentsJoinedByString:@", "]];
}
@end

// The builder assembles a Pizza step by step and returns itself from each
// step, so calls can be chained before the final object is produced.
@interface PizzaBuilder : NSObject
- (instancetype)setSize:(NSString *)size;
- (instancetype)addTopping:(NSString *)topping;
- (Pizza *)build;
@end

@implementation PizzaBuilder {
    Pizza *_pizza;
}

- (instancetype)init {
    self = [super init];
    if (self) _pizza = [[Pizza alloc] init];
    return self;
}

- (instancetype)setSize:(NSString *)size {
    _pizza.size = size;
    return self;
}

- (instancetype)addTopping:(NSString *)topping {
    [_pizza.toppings addObject:topping];
    return self;
}

- (Pizza *)build {
    return _pizza;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Pizza *pizza = [[[[[PizzaBuilder alloc] init]
            setSize:@"Large"]
            addTopping:@"mushrooms"]
            addTopping:@"olives"]
            build];
        NSLog(@"%@", [pizza describe]);
    }
    return 0;
}
