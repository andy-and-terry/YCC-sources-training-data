#import <Foundation/Foundation.h>
@protocol Worker <NSObject>
- (void)run;
@optional
- (void)didFinish;
@end
@interface Job : NSObject <Worker> @end
@implementation Job
- (void)run { NSLog(@"running"); }
@end
int main(void) {
    @autoreleasepool {
        Job *j = [Job new]; [j run];
        if ([j respondsToSelector:@selector(didFinish)]) [j didFinish]; else NSLog(@"no finish");
    }
    return 0;
}
