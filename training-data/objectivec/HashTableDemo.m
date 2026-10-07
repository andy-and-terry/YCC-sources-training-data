#import <Foundation/Foundation.h>

@interface HashEntry : NSObject
@property (nonatomic, copy) NSString *key;
@property (nonatomic) NSInteger value;
@property (nonatomic, strong) HashEntry *next;
@end

@implementation HashEntry
@end

@interface SimpleHashTable : NSObject
- (instancetype)initWithBucketCount:(NSInteger)count;
- (void)setValue:(NSInteger)value forKey:(NSString *)key;
- (BOOL)valueForKey:(NSString *)key outValue:(NSInteger *)outValue;
@end

@implementation SimpleHashTable {
    NSMutableArray *_buckets;
    NSInteger _bucketCount;
}

- (instancetype)initWithBucketCount:(NSInteger)count {
    self = [super init];
    if (self) {
        _bucketCount = count;
        _buckets = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger i = 0; i < count; i++) {
            [_buckets addObject:[NSNull null]];
        }
    }
    return self;
}

- (NSInteger)bucketIndexForKey:(NSString *)key {
    return (NSInteger)(key.hash % (NSUInteger)_bucketCount);
}

- (void)setValue:(NSInteger)value forKey:(NSString *)key {
    NSInteger index = [self bucketIndexForKey:key];
    HashEntry *head = (_buckets[index] == [NSNull null]) ? nil : _buckets[index];
    for (HashEntry *e = head; e != nil; e = e.next) {
        if ([e.key isEqualToString:key]) {
            e.value = value;
            return;
        }
    }
    HashEntry *newEntry = [[HashEntry alloc] init];
    newEntry.key = key;
    newEntry.value = value;
    newEntry.next = head;
    _buckets[index] = newEntry;
}

- (BOOL)valueForKey:(NSString *)key outValue:(NSInteger *)outValue {
    NSInteger index = [self bucketIndexForKey:key];
    id bucket = _buckets[index];
    if (bucket == [NSNull null]) return NO;
    for (HashEntry *e = bucket; e != nil; e = e.next) {
        if ([e.key isEqualToString:key]) {
            if (outValue) *outValue = e.value;
            return YES;
        }
    }
    return NO;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        SimpleHashTable *table = [[SimpleHashTable alloc] initWithBucketCount:8];
        [table setValue:1 forKey:@"apple"];
        [table setValue:2 forKey:@"banana"];
        [table setValue:10 forKey:@"apple"];

        NSInteger value = 0;
        [table valueForKey:@"apple" outValue:&value];
        NSLog(@"apple = %ld", (long)value);

        [table valueForKey:@"banana" outValue:&value];
        NSLog(@"banana = %ld", (long)value);

        NSLog(@"has cherry: %@", [table valueForKey:@"cherry" outValue:&value] ? @"YES" : @"NO");
    }
    return 0;
}
