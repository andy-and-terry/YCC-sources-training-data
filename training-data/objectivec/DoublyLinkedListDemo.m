#import <Foundation/Foundation.h>

// Unlike LinkedListDemo.m (singly linked), each node here also holds a
// pointer back to its predecessor, so the list can be walked in both
// directions and a node can be removed in O(1) once found.
@interface DListNode : NSObject
@property (nonatomic) NSInteger value;
@property (nonatomic, strong) DListNode *next;
@property (nonatomic, weak) DListNode *prev;
@end

@implementation DListNode
@end

@interface DoublyLinkedList : NSObject
@property (nonatomic, strong) DListNode *head;
@property (nonatomic, strong) DListNode *tail;
- (void)appendValue:(NSInteger)value;
- (void)removeNode:(DListNode *)node;
- (NSArray<NSNumber *> *)valuesForward;
- (NSArray<NSNumber *> *)valuesBackward;
@end

@implementation DoublyLinkedList
- (void)appendValue:(NSInteger)value {
    DListNode *node = [[DListNode alloc] init];
    node.value = value;
    if (self.tail == nil) {
        self.head = node;
        self.tail = node;
    } else {
        node.prev = self.tail;
        self.tail.next = node;
        self.tail = node;
    }
}

- (void)removeNode:(DListNode *)node {
    if (node.prev) {
        node.prev.next = node.next;
    } else {
        self.head = node.next;
    }
    if (node.next) {
        node.next.prev = node.prev;
    } else {
        self.tail = node.prev;
    }
}

- (NSArray<NSNumber *> *)valuesForward {
    NSMutableArray *result = [NSMutableArray array];
    for (DListNode *cur = self.head; cur != nil; cur = cur.next) {
        [result addObject:@(cur.value)];
    }
    return result;
}

- (NSArray<NSNumber *> *)valuesBackward {
    NSMutableArray *result = [NSMutableArray array];
    for (DListNode *cur = self.tail; cur != nil; cur = cur.prev) {
        [result addObject:@(cur.value)];
    }
    return result;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        DoublyLinkedList *list = [[DoublyLinkedList alloc] init];
        for (NSInteger v = 1; v <= 5; v++) [list appendValue:v];
        NSLog(@"forward: %@", [list valuesForward]);
        NSLog(@"backward: %@", [list valuesBackward]);

        DListNode *cur = list.head.next; // the node holding value 2
        [list removeNode:cur];
        NSLog(@"after removing 2, forward: %@", [list valuesForward]);
    }
    return 0;
}
