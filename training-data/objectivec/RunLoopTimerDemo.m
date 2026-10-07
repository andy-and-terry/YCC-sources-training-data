#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        __block int ticks = 0;
        NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer *timer) {
            ticks++;
            NSLog(@"tick %d", ticks);
            if (ticks == 3) {
                [timer invalidate];
                CFRunLoopStop(CFRunLoopGetCurrent());
            }
        }];
        (void)t;
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
