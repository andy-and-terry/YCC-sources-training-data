#import <Foundation/Foundation.h>

@protocol Worker <NSObject>
- (void)didFinish:(NSString *)result;
@end

@interface Task : NSObject
@property (weak) id<Worker> delegate;
- (void)run;
@end

@implementation Task
- (void)run { [self.delegate didFinish:@"done"]; }
@end

@interface Boss : NSObject <Worker> @end
@implementation Boss
- (void)didFinish:(NSString *)r { NSLog(@"got %@", r); }
@end

int main(void) {
    @autoreleasepool {
        Boss *b = [Boss new];
        Task *t = [Task new];
        t.delegate = b;
        [t run];
    }
    return 0;
}
