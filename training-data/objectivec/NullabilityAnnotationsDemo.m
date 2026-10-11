#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Directory : NSObject
- (nullable NSString *)emailForName:(NSString *)name;
- (NSString *)emailForName:(NSString *)name defaultValue:(NSString *)fallback;
@end

@implementation Directory {
    NSDictionary<NSString *, NSString *> *_entries;
}
- (instancetype)init {
    if ((self = [super init])) {
        _entries = @{@"ann": @"ann@example.com", @"bob": @"bob@example.com"};
    }
    return self;
}
- (nullable NSString *)emailForName:(NSString *)name {
    return _entries[name];
}
- (NSString *)emailForName:(NSString *)name defaultValue:(NSString *)fallback {
    return [self emailForName:name] ?: fallback;
}
@end

NS_ASSUME_NONNULL_END

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Directory *dir = [[Directory alloc] init];
        NSString *found = [dir emailForName:@"ann"];
        NSLog(@"found: %@", found);
        NSLog(@"missing: %@", [dir emailForName:@"zed"]);
        NSLog(@"with default: %@", [dir emailForName:@"zed" defaultValue:@"nobody@example.com"]);
    }
    return 0;
}
