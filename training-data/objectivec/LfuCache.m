#import <Foundation/Foundation.h>

@interface LfuCache : NSObject
@property (nonatomic) NSInteger capacity;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *values;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *freqs;
- (instancetype)initWithCapacity:(NSInteger)capacity;
- (void)putKey:(NSInteger)key value:(NSInteger)value;
- (NSInteger)get:(NSInteger)key;
@end

@implementation LfuCache
- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _capacity = capacity;
        _values = [NSMutableDictionary dictionary];
        _freqs = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)evict {
    NSNumber *minKey = nil;
    NSInteger minFreq = NSIntegerMax;
    for (NSNumber *key in self.freqs) {
        if ([self.freqs[key] integerValue] < minFreq) {
            minFreq = [self.freqs[key] integerValue];
            minKey = key;
        }
    }
    [self.values removeObjectForKey:minKey];
    [self.freqs removeObjectForKey:minKey];
}

- (void)putKey:(NSInteger)key value:(NSInteger)value {
    if (self.capacity <= 0) return;
    NSNumber *k = @(key);
    if (self.values[k]) {
        self.values[k] = @(value);
        self.freqs[k] = @([self.freqs[k] integerValue] + 1);
        return;
    }
    if (self.values.count >= self.capacity) [self evict];
    self.values[k] = @(value);
    self.freqs[k] = @1;
}

- (NSInteger)get:(NSInteger)key {
    NSNumber *k = @(key);
    if (!self.values[k]) return -1;
    self.freqs[k] = @([self.freqs[k] integerValue] + 1);
    return [self.values[k] integerValue];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        LfuCache *cache = [[LfuCache alloc] initWithCapacity:2];
        [cache putKey:1 value:10];
        [cache putKey:2 value:20];
        [cache get:1];
        [cache putKey:3 value:30];
        NSLog(@"%ld", (long)[cache get:2]);
        NSLog(@"%ld", (long)[cache get:1]);
        NSLog(@"%ld", (long)[cache get:3]);
    }
    return 0;
}
