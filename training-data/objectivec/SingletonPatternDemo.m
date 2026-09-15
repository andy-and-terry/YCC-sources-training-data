#import <Foundation/Foundation.h>

@interface AppConfig : NSObject
@property (nonatomic, strong) NSMutableDictionary *settings;
+ (instancetype)sharedConfig;
@end

@implementation AppConfig

+ (instancetype)sharedConfig {
    static AppConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AppConfig alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _settings = [NSMutableDictionary dictionary];
    }
    return self;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        AppConfig *first = [AppConfig sharedConfig];
        first.settings[@"theme"] = @"dark";

        AppConfig *second = [AppConfig sharedConfig];
        NSLog(@"%@", second.settings[@"theme"]);
        NSLog(@"%@", first == second ? @"same instance" : @"different instance");
    }
    return 0;
}
