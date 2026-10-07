#import <Foundation/Foundation.h>

// NSNotificationCenter is Objective-C's built-in publish/subscribe
// mechanism: observers register for a named notification and are
// invoked whenever any object posts one, with no direct reference
// between poster and observer.
static NSString *const kTemperatureChangedNotification = @"TemperatureChangedNotification";

@interface WeatherStation : NSObject
- (void)setTemperature:(double)temperature;
@end

@implementation WeatherStation
- (void)setTemperature:(double)temperature {
    [[NSNotificationCenter defaultCenter]
        postNotificationName:kTemperatureChangedNotification
        object:self
        userInfo:@{ @"temperature": @(temperature) }];
}
@end

@interface Display : NSObject
- (void)startObserving;
- (void)handleTemperatureChange:(NSNotification *)notification;
@end

@implementation Display
- (void)startObserving {
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(handleTemperatureChange:)
        name:kTemperatureChangedNotification
        object:nil];
}
- (void)handleTemperatureChange:(NSNotification *)notification {
    NSNumber *temperature = notification.userInfo[@"temperature"];
    NSLog(@"Display updated: %@ degrees", temperature);
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        WeatherStation *station = [[WeatherStation alloc] init];
        Display *display = [[Display alloc] init];
        [display startObserving];

        [station setTemperature:72.5];
        [station setTemperature:68.0];
    }
    return 0;
}
