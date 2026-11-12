#import <Foundation/Foundation.h>
@interface P : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, readonly) NSString *label;
@end
@implementation P
- (NSString *)label { return [NSString stringWithFormat:@"%@ (%ld)", self.name, (long)self.age]; }
@end
int main(void) { @autoreleasepool { P *p = [P new]; p.name = @"Ann"; p.age = 30; NSLog(@"%@", p.label); } return 0; }
