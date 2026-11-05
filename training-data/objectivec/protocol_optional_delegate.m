#import <Foundation/Foundation.h>

@protocol Worker <NSObject>
- (void)didFinish:(NSString *)name;
@optional
- (void)didProgress:(int)pct;
@end

@interface Task : NSObject
@property (weak) id<Worker> delegate;
- (void)run;
@end

@implementation Task
- (void)run {
    if ([self.delegate respondsToSelector:@selector(didProgress:)]) [self.delegate didProgress:50];
    [self.delegate didFinish:@"task"];
}
@end

@interface Owner : NSObject <Worker>
@end
@implementation Owner
- (void)didFinish:(NSString *)name { NSLog(@"finished %@", name); }
@end

int main(void) {
    @autoreleasepool {
        Owner *o = [Owner new];
        Task *t = [Task new];
        t.delegate = o;
        [t run];
    }
    return 0;
}
