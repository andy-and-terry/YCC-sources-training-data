#import <Foundation/Foundation.h>

@interface Box<ObjectType> : NSObject
@property (nonatomic, strong) ObjectType content;
- (instancetype)initWithContent:(ObjectType)content;
- (ObjectType)unwrap;
@end

@implementation Box
- (instancetype)initWithContent:(id)content {
    if ((self = [super init])) { _content = content; }
    return self;
}
- (id)unwrap { return self.content; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Box<NSString *> *textBox = [[Box alloc] initWithContent:@"hello"];
        NSLog(@"length: %lu", (unsigned long)[textBox unwrap].length);

        Box<NSNumber *> *numberBox = [[Box alloc] initWithContent:@41];
        NSLog(@"next: %d", [numberBox unwrap].intValue + 1);

        NSDictionary<NSString *, Box<NSNumber *> *> *lookup = @{@"answer": numberBox};
        NSLog(@"lookup: %@", lookup[@"answer"].content);
    }
    return 0;
}
