#import <Foundation/Foundation.h>

@interface Note : NSObject <NSSecureCoding>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger priority;
@end

@implementation Note
+ (BOOL)supportsSecureCoding { return YES; }
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeInteger:self.priority forKey:@"priority"];
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        _title = [coder decodeObjectOfClass:[NSString class] forKey:@"title"];
        _priority = [coder decodeIntegerForKey:@"priority"];
    }
    return self;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Note *n = [[Note alloc] init];
        n.title = @"Buy milk";
        n.priority = 2;

        NSError *error = nil;
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:n requiringSecureCoding:YES error:&error];
        NSLog(@"archived bytes > 0: %d", data.length > 0);

        Note *copy = [NSKeyedUnarchiver unarchivedObjectOfClass:[Note class] fromData:data error:&error];
        NSLog(@"restored: %@ (priority %ld)", copy.title, (long)copy.priority);
    }
    return 0;
}
