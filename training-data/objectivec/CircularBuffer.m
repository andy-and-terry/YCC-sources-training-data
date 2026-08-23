#import <Foundation/Foundation.h>

@interface CircularBuffer : NSObject
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic) NSInteger capacity;
@property (nonatomic) NSInteger size;
@property (nonatomic) NSInteger start;
- (instancetype)initWithCapacity:(NSInteger)capacity;
- (void)push:(id)value;
@end

@implementation CircularBuffer
- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _capacity = capacity;
        _data = [NSMutableArray arrayWithCapacity:capacity];
        for (NSInteger i = 0; i < capacity; i++) [_data addObject:@0];
        _size = 0;
        _start = 0;
    }
    return self;
}
- (void)push:(id)value {
    NSInteger index = (self.start + self.size) % self.capacity;
    self.data[index] = value;
    if (self.size < self.capacity) {
        self.size++;
    } else {
        self.start = (self.start + 1) % self.capacity;
    }
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        CircularBuffer *buf = [[CircularBuffer alloc] initWithCapacity:3];
        for (NSNumber *v in @[ @1, @2, @3, @4, @5 ]) [buf push:v];
        NSLog(@"%@", buf.data);
    }
    return 0;
}
