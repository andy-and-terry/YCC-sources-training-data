#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject {
    NSString *_secret;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
- (void)greet;
- (void)birthday;
@end

@implementation Person
- (void)greet {}
- (void)birthday { self.age++; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        unsigned int count = 0;

        Method *methods = class_copyMethodList([Person class], &count);
        for (unsigned int i = 0; i < count; i++) {
            NSLog(@"method: %s", sel_getName(method_getName(methods[i])));
        }
        free(methods);

        objc_property_t *props = class_copyPropertyList([Person class], &count);
        for (unsigned int i = 0; i < count; i++) {
            NSLog(@"property: %s", property_getName(props[i]));
        }
        free(props);

        Ivar *ivars = class_copyIvarList([Person class], &count);
        for (unsigned int i = 0; i < count; i++) {
            NSLog(@"ivar: %s", ivar_getName(ivars[i]));
        }
        free(ivars);

        NSLog(@"superclass: %s", class_getName(class_getSuperclass([Person class])));
    }
    return 0;
}
