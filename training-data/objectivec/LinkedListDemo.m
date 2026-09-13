#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (nonatomic) NSInteger value;
@property (nonatomic, strong) ListNode *next;
- (instancetype)initWithValue:(NSInteger)value;
@end

@implementation ListNode
- (instancetype)initWithValue:(NSInteger)value {
    self = [super init];
    if (self) _value = value;
    return self;
}
@end

@interface LinkedList : NSObject
@property (nonatomic, strong) ListNode *head;
- (void)append:(NSInteger)value;
- (NSArray<NSNumber *> *)toArray;
@end

@implementation LinkedList
- (void)append:(NSInteger)value {
    ListNode *node = [[ListNode alloc] initWithValue:value];
    if (!self.head) {
        self.head = node;
        return;
    }
    ListNode *current = self.head;
    while (current.next) {
        current = current.next;
    }
    current.next = node;
}
- (NSArray<NSNumber *> *)toArray {
    NSMutableArray<NSNumber *> *result = [NSMutableArray array];
    ListNode *current = self.head;
    while (current) {
        [result addObject:@(current.value)];
        current = current.next;
    }
    return result;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        LinkedList *list = [[LinkedList alloc] init];
        [list append:1];
        [list append:2];
        [list append:3];
        NSLog(@"%@", [list toArray]);
    }
    return 0;
}
