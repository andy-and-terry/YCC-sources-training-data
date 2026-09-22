#import <Foundation/Foundation.h>
#import <objc/runtime.h>

// A plain category cannot add instance variables to an existing class,
// but the Objective-C runtime's associated objects let a category
// simulate a stored property on a class it does not own, such as NSObject.
static void *kTagKey = &kTagKey;

@interface NSObject (Tagging)
@property (nonatomic, copy) NSString *tag;
@end

@implementation NSObject (Tagging)
- (void)setTag:(NSString *)tag {
    objc_setAssociatedObject(self, kTagKey, tag, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)tag {
    return objc_getAssociatedObject(self, kTagKey);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSObject *a = [[NSObject alloc] init];
        NSObject *b = [[NSObject alloc] init];
        a.tag = @"first";
        b.tag = @"second";
        NSLog(@"%@ %@", a.tag, b.tag);
    }
    return 0;
}
