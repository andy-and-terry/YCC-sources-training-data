#import <Foundation/Foundation.h>

@interface BloomFilter : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *bits;
@property (nonatomic) NSInteger size;
- (instancetype)initWithSize:(NSInteger)size;
- (void)add:(NSString *)value;
- (BOOL)mightContain:(NSString *)value;
@end

@implementation BloomFilter
- (instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    if (self) {
        _size = size;
        _bits = [NSMutableArray arrayWithCapacity:size];
        for (NSInteger i = 0; i < size; i++) [_bits addObject:@NO];
    }
    return self;
}

- (NSInteger)hash1:(NSString *)s {
    NSInteger h = 0;
    for (NSInteger i = 0; i < s.length; i++) h = (h * 31 + [s characterAtIndex:i]) % self.size;
    return h;
}

- (NSInteger)hash2:(NSString *)s {
    NSInteger h = 0;
    for (NSInteger i = 0; i < s.length; i++) h = (h * 17 + [s characterAtIndex:i] + 7) % self.size;
    return h;
}

- (void)add:(NSString *)value {
    self.bits[[self hash1:value]] = @YES;
    self.bits[[self hash2:value]] = @YES;
}

- (BOOL)mightContain:(NSString *)value {
    return [self.bits[[self hash1:value]] boolValue] && [self.bits[[self hash2:value]] boolValue];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        BloomFilter *bf = [[BloomFilter alloc] initWithSize:64];
        [bf add:@"apple"];
        [bf add:@"banana"];
        NSLog(@"%@", [bf mightContain:@"apple"] ? @"YES" : @"NO");
        NSLog(@"%@", [bf mightContain:@"cherry"] ? @"YES" : @"NO");
    }
    return 0;
}
