#import <Foundation/Foundation.h>

@interface CacheLogger : NSObject <NSCacheDelegate>
@end

@implementation CacheLogger
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    NSLog(@"evicting %@", obj);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSCache<NSString *, NSString *> *cache = [[NSCache alloc] init];
        CacheLogger *logger = [[CacheLogger alloc] init];
        cache.delegate = logger;
        cache.countLimit = 2;
        cache.name = @"demo";

        [cache setObject:@"one" forKey:@"1"];
        [cache setObject:@"two" forKey:@"2"];
        NSLog(@"hit: %@", [cache objectForKey:@"1"]);
        NSLog(@"miss: %@", [cache objectForKey:@"9"]);

        [cache removeObjectForKey:@"1"];
        NSLog(@"after removal: %@", [cache objectForKey:@"1"]);
        [cache removeAllObjects];
    }
    return 0;
}
