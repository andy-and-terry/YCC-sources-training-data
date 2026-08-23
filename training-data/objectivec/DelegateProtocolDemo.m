#import <Foundation/Foundation.h>

@protocol EventDelegate <NSObject>
- (void)didReceiveEvent:(NSString *)event;
@end

@interface EventEmitter : NSObject
@property (nonatomic, weak) id<EventDelegate> delegate;
- (void)fire;
@end

@implementation EventEmitter
- (void)fire {
    if ([self.delegate respondsToSelector:@selector(didReceiveEvent:)]) {
        [self.delegate didReceiveEvent:@"ping"];
    }
}
@end

@interface Listener : NSObject <EventDelegate>
@end

@implementation Listener
- (void)didReceiveEvent:(NSString *)event {
    NSLog(@"Received: %@", event);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        EventEmitter *emitter = [[EventEmitter alloc] init];
        Listener *listener = [[Listener alloc] init];
        emitter.delegate = listener;
        [emitter fire];
    }
    return 0;
}
