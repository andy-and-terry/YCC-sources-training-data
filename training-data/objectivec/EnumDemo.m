#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Direction) {
    DirectionNorth,
    DirectionSouth,
    DirectionEast,
    DirectionWest
};

NSString *describeDirection(Direction d) {
    switch (d) {
        case DirectionNorth: return @"going up";
        case DirectionSouth: return @"going down";
        case DirectionEast: return @"going right";
        case DirectionWest: return @"going left";
    }
    return @"unknown";
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", describeDirection(DirectionNorth));
        NSLog(@"%@", describeDirection(DirectionWest));
    }
    return 0;
}
