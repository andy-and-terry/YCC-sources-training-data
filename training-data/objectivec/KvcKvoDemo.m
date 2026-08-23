#import <Foundation/Foundation.h>

@interface Counter : NSObject
@property (nonatomic) NSInteger value;
@end

@implementation Counter
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Counter *counter = [[Counter alloc] init];
        [counter setValue:@(5) forKey:@"value"];
        NSLog(@"%@", [counter valueForKey:@"value"]);
    }
    return 0;
}
