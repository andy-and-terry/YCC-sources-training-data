#import <Foundation/Foundation.h>

@interface Account : NSObject <NSSecureCoding>
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, assign) NSInteger balance;
@end

@implementation Account
+ (BOOL)supportsSecureCoding { return YES; }
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.owner forKey:@"owner"];
    [coder encodeInteger:self.balance forKey:@"balance"];
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        _owner = [coder decodeObjectOfClass:[NSString class] forKey:@"owner"];
        _balance = [coder decodeIntegerForKey:@"balance"];
    }
    return self;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Account *a = [Account new];
        a.owner = @"Ann";
        a.balance = 120;
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:a requiringSecureCoding:YES error:nil];
        Account *b = [NSKeyedUnarchiver unarchivedObjectOfClass:[Account class] fromData:data error:nil];
        NSLog(@"%@ has %ld", b.owner, (long)b.balance);
    }
    return 0;
}
