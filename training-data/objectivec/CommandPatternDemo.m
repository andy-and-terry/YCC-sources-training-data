#include <stdio.h>
#include <stdlib.h>

// Deliberately Foundation-free: this sandbox only has bare clang (no
// Foundation framework). See StrategyPatternDemo.m for the root-class
// convention this file (and the other pattern demos) follow.

@protocol Command
- (void)execute;
- (void)undo;
@end

@interface Light
{
@public
    Class isa;
    int isOn;
}
+ (instancetype)new;
- (void)turnOn;
- (void)turnOff;
@end

@implementation Light
+ (instancetype)new {
    Light *obj = (Light *)calloc(1, sizeof(Light));
    obj->isa = self;
    return obj;
}
- (void)turnOn {
    isOn = 1;
    printf("light is ON\n");
}
- (void)turnOff {
    isOn = 0;
    printf("light is OFF\n");
}
@end

@interface LightOnCommand <Command>
{
@public
    Class isa;
    Light *light;
}
+ (instancetype)newWithLight:(Light *)light;
@end

@implementation LightOnCommand
+ (instancetype)newWithLight:(Light *)l {
    LightOnCommand *obj = (LightOnCommand *)calloc(1, sizeof(LightOnCommand));
    obj->isa = self;
    obj->light = l;
    return obj;
}
- (void)execute {
    [light turnOn];
}
- (void)undo {
    [light turnOff];
}
@end

@interface LightOffCommand <Command>
{
@public
    Class isa;
    Light *light;
}
+ (instancetype)newWithLight:(Light *)light;
@end

@implementation LightOffCommand
+ (instancetype)newWithLight:(Light *)l {
    LightOffCommand *obj = (LightOffCommand *)calloc(1, sizeof(LightOffCommand));
    obj->isa = self;
    obj->light = l;
    return obj;
}
- (void)execute {
    [light turnOff];
}
- (void)undo {
    [light turnOn];
}
@end

@interface RemoteControl
{
@public
    Class isa;
    id<Command> history[8];
    int historyCount;
}
+ (instancetype)new;
- (void)pressButton:(id<Command>)command;
- (void)pressUndo;
@end

@implementation RemoteControl
+ (instancetype)new {
    RemoteControl *obj = (RemoteControl *)calloc(1, sizeof(RemoteControl));
    obj->isa = self;
    return obj;
}
- (void)pressButton:(id<Command>)command {
    [command execute];
    history[historyCount++] = command;
}
- (void)pressUndo {
    if (historyCount == 0) return;
    id<Command> last = history[--historyCount];
    [last undo];
}
@end

int main(void) {
    Light *light = [Light new];
    id<Command> on = [LightOnCommand newWithLight:light];
    id<Command> off = [LightOffCommand newWithLight:light];

    RemoteControl *remote = [RemoteControl new];
    [remote pressButton:on];
    [remote pressButton:off];
    [remote pressUndo];
    [remote pressUndo];

    return 0;
}
