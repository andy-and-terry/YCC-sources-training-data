#import <Foundation/Foundation.h>

@interface LLNode : NSObject
@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) LLNode *next;
@end

@implementation LLNode
@end

@interface SinglyLinkedList : NSObject
@property (nonatomic, strong) LLNode *head;
- (void)addValue:(NSNumber *)value;
- (NSArray<NSNumber *> *)toArray;
- (void)reverse;
@end

@implementation SinglyLinkedList
- (void)addValue:(NSNumber *)value {
    LLNode *node = [[LLNode alloc] init];
    node.value = value;
    if (!self.head) {
        self.head = node;
        return;
    }
    LLNode *cur = self.head;
    while (cur.next) cur = cur.next;
    cur.next = node;
}

- (NSArray<NSNumber *> *)toArray {
    NSMutableArray *result = [NSMutableArray array];
    LLNode *cur = self.head;
    while (cur) {
        [result addObject:cur.value];
        cur = cur.next;
    }
    return result;
}

- (void)reverse {
    LLNode *prev = nil;
    LLNode *cur = self.head;
    while (cur) {
        LLNode *next = cur.next;
        cur.next = prev;
        prev = cur;
        cur = next;
    }
    self.head = prev;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        SinglyLinkedList *list = [[SinglyLinkedList alloc] init];
        for (NSInteger i = 1; i <= 5; i++) [list addValue:@(i)];
        NSLog(@"%@", [list toArray]);
        [list reverse];
        NSLog(@"%@", [list toArray]);
    }
    return 0;
}
