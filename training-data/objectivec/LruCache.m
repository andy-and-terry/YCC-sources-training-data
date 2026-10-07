#import <Foundation/Foundation.h>

// A fixed-capacity cache that evicts the least recently used entry.
// Recency is tracked with an order array of keys; the most recently
// touched key is always moved to the end.
@interface LruCache : NSObject
- (instancetype)initWithCapacity:(NSInteger)capacity;
- (void)putKey:(NSString *)key value:(id)value;
- (id)getKey:(NSString *)key;
@end

@implementation LruCache {
    NSInteger _capacity;
    NSMutableDictionary<NSString *, id> *_store;
    NSMutableArray<NSString *> *_order;
}

- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _capacity = capacity;
        _store = [NSMutableDictionary dictionary];
        _order = [NSMutableArray array];
    }
    return self;
}

- (void)touchKey:(NSString *)key {
    [_order removeObject:key];
    [_order addObject:key];
}

- (void)putKey:(NSString *)key value:(id)value {
    if (_store[key] == nil && _store.count >= (NSUInteger)_capacity) {
        NSString *oldest = _order.firstObject;
        if (oldest) {
            [_store removeObjectForKey:oldest];
            [_order removeObjectAtIndex:0];
        }
    }
    _store[key] = value;
    [self touchKey:key];
}

- (id)getKey:(NSString *)key {
    id value = _store[key];
    if (value != nil) {
        [self touchKey:key];
    }
    return value;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        LruCache *cache = [[LruCache alloc] initWithCapacity:2];
        [cache putKey:@"a" value:@1];
        [cache putKey:@"b" value:@2];
        NSLog(@"a = %@", [cache getKey:@"a"]);
        [cache putKey:@"c" value:@3];
        NSLog(@"b = %@", [cache getKey:@"b"]);
        NSLog(@"a = %@", [cache getKey:@"a"]);
        NSLog(@"c = %@", [cache getKey:@"c"]);
    }
    return 0;
}
