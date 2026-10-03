#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Deliberately Foundation-free: this sandbox only has bare clang (no
// Foundation framework). See StrategyPatternDemo.m for the root-class
// convention this file (and the other pattern demos) follow.

@interface Car
{
@public
    Class isa;
    char engine[32];
    int wheels;
    int hasGPS;
}
+ (instancetype)new;
- (void)describe;
@end

@implementation Car
+ (instancetype)new {
    Car *obj = (Car *)calloc(1, sizeof(Car));
    obj->isa = self;
    return obj;
}
- (void)describe {
    printf("Car[engine=%s, wheels=%d, gps=%s]\n", engine, wheels, hasGPS ? "yes" : "no");
}
@end

@interface CarBuilder
{
@public
    Class isa;
    Car *car;
}
+ (instancetype)new;
- (instancetype)setEngine:(const char *)engine;
- (instancetype)setWheels:(int)wheels;
- (instancetype)addGPS;
- (Car *)build;
@end

@implementation CarBuilder
+ (instancetype)new {
    CarBuilder *obj = (CarBuilder *)calloc(1, sizeof(CarBuilder));
    obj->isa = self;
    obj->car = [Car new];
    return obj;
}
- (instancetype)setEngine:(const char *)engine {
    strncpy(car->engine, engine, sizeof(car->engine) - 1);
    return self;
}
- (instancetype)setWheels:(int)wheels {
    car->wheels = wheels;
    return self;
}
- (instancetype)addGPS {
    car->hasGPS = 1;
    return self;
}
- (Car *)build {
    return car;
}
@end

int main(void) {
    CarBuilder *builder = [CarBuilder new];
    Car *sedan = [[[[builder setEngine:"V6"] setWheels:4] addGPS] build];
    [sedan describe];

    CarBuilder *builder2 = [CarBuilder new];
    Car *stripped = [[[builder2 setEngine:"I4"] setWheels:4] build];
    [stripped describe];

    return 0;
}
