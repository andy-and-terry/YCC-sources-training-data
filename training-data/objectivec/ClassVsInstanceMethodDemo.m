#import <Foundation/Foundation.h>

// A class method (declared with +) belongs to the class itself and has
// no access to any particular instance's ivars; it is used here to track
// state shared by every Widget. An instance method (declared with -)
// operates on one specific object, referenced through self.
@interface Widget : NSObject
@property (nonatomic) NSInteger serialNumber;
+ (NSInteger)totalWidgetsCreated;
+ (instancetype)widgetFactory;
- (void)describe;
@end

static NSInteger sTotalWidgetsCreated = 0;

@implementation Widget
+ (NSInteger)totalWidgetsCreated {
    return sTotalWidgetsCreated;
}

+ (instancetype)widgetFactory {
    Widget *widget = [[Widget alloc] init];
    sTotalWidgetsCreated += 1;
    widget.serialNumber = sTotalWidgetsCreated;
    return widget;
}

- (void)describe {
    NSLog(@"widget #%ld (of %ld made so far)", (long)self.serialNumber, (long)[Widget totalWidgetsCreated]);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Widget *a = [Widget widgetFactory];
        Widget *b = [Widget widgetFactory];
        Widget *c = [Widget widgetFactory];

        [a describe];
        [b describe];
        [c describe];

        NSLog(@"total via class method: %ld", (long)[Widget totalWidgetsCreated]);
    }
    return 0;
}
