#import <Foundation/Foundation.h>

@class TrafficLight;

@protocol LightState <NSObject>
- (void)handle:(TrafficLight *)light;
- (NSString *)name;
@end

@interface TrafficLight : NSObject
@property (nonatomic, strong) id<LightState> state;
- (void)change;
@end

@implementation TrafficLight
- (void)change {
    [self.state handle:self];
}
@end

@interface RedState : NSObject <LightState>
@end
@interface GreenState : NSObject <LightState>
@end
@interface YellowState : NSObject <LightState>
@end

@implementation RedState
- (void)handle:(TrafficLight *)light { light.state = [[GreenState alloc] init]; }
- (NSString *)name { return @"Red"; }
@end

@implementation GreenState
- (void)handle:(TrafficLight *)light { light.state = [[YellowState alloc] init]; }
- (NSString *)name { return @"Green"; }
@end

@implementation YellowState
- (void)handle:(TrafficLight *)light { light.state = [[RedState alloc] init]; }
- (NSString *)name { return @"Yellow"; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        TrafficLight *light = [[TrafficLight alloc] init];
        light.state = [[RedState alloc] init];
        for (NSInteger i = 0; i < 4; i++) {
            NSLog(@"%@", [light.state name]);
            [light change];
        }
    }
    return 0;
}
