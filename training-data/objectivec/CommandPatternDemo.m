#import <Foundation/Foundation.h>

// The receiver that commands ultimately act on.
@interface Light : NSObject
@property (nonatomic) BOOL isOn;
- (void)turnOn;
- (void)turnOff;
@end

@implementation Light
- (void)turnOn { self.isOn = YES; NSLog(@"Light is ON"); }
- (void)turnOff { self.isOn = NO; NSLog(@"Light is OFF"); }
@end

// Each concrete command encapsulates a receiver plus the action to invoke
// on it, so the invoker never needs to know about Light directly.
@protocol Command <NSObject>
- (void)execute;
- (void)undo;
@end

@interface LightOnCommand : NSObject <Command>
@property (nonatomic, strong) Light *light;
- (instancetype)initWithLight:(Light *)light;
@end

@implementation LightOnCommand
- (instancetype)initWithLight:(Light *)light {
    self = [super init];
    if (self) _light = light;
    return self;
}
- (void)execute { [self.light turnOn]; }
- (void)undo { [self.light turnOff]; }
@end

@interface LightOffCommand : NSObject <Command>
@property (nonatomic, strong) Light *light;
- (instancetype)initWithLight:(Light *)light;
@end

@implementation LightOffCommand
- (instancetype)initWithLight:(Light *)light {
    self = [super init];
    if (self) _light = light;
    return self;
}
- (void)execute { [self.light turnOff]; }
- (void)undo { [self.light turnOn]; }
@end

@interface RemoteControl : NSObject
@property (nonatomic, strong) NSMutableArray<id<Command>> *history;
- (void)press:(id<Command>)command;
- (void)pressUndo;
@end

@implementation RemoteControl
- (instancetype)init {
    self = [super init];
    if (self) _history = [NSMutableArray array];
    return self;
}
- (void)press:(id<Command>)command {
    [command execute];
    [self.history addObject:command];
}
- (void)pressUndo {
    id<Command> last = self.history.lastObject;
    if (last) {
        [last undo];
        [self.history removeLastObject];
    }
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Light *light = [[Light alloc] init];
        RemoteControl *remote = [[RemoteControl alloc] init];
        [remote press:[[LightOnCommand alloc] initWithLight:light]];
        [remote press:[[LightOffCommand alloc] initWithLight:light]];
        [remote pressUndo];
    }
    return 0;
}
