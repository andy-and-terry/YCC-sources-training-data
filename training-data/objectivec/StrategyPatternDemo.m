#include <stdio.h>
#include <stdlib.h>

// Deliberately Foundation-free: this sandbox only has bare clang (no
// Foundation framework), so each concrete strategy is its own root
// class with a hand-rolled `+new`, and dispatch goes through a plain
// @protocol instead of NSObject/id<NSObject>. This compiles cleanly
// with `clang -c`; actually *linking* an executable would additionally
// need the Objective-C runtime library wired up, which this sandbox
// does not have configured for the default clang toolchain.

@protocol SortStrategy
- (void)sortArray:(int *)array count:(int)count;
- (const char *)name;
@end

@interface BubbleSortStrategy <SortStrategy>
{
@public
    Class isa;
}
+ (instancetype)new;
@end

@implementation BubbleSortStrategy
+ (instancetype)new {
    BubbleSortStrategy *obj = (BubbleSortStrategy *)calloc(1, sizeof(BubbleSortStrategy));
    obj->isa = self;
    return obj;
}
- (void)sortArray:(int *)array count:(int)count {
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                int tmp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tmp;
            }
        }
    }
}
- (const char *)name {
    return "bubble sort";
}
@end

@interface InsertionSortStrategy <SortStrategy>
{
@public
    Class isa;
}
+ (instancetype)new;
@end

@implementation InsertionSortStrategy
+ (instancetype)new {
    InsertionSortStrategy *obj = (InsertionSortStrategy *)calloc(1, sizeof(InsertionSortStrategy));
    obj->isa = self;
    return obj;
}
- (void)sortArray:(int *)array count:(int)count {
    for (int i = 1; i < count; i++) {
        int key = array[i];
        int j = i - 1;
        while (j >= 0 && array[j] > key) {
            array[j + 1] = array[j];
            j--;
        }
        array[j + 1] = key;
    }
}
- (const char *)name {
    return "insertion sort";
}
@end

@interface SortContext
{
@public
    Class isa;
    id<SortStrategy> strategy;
}
+ (instancetype)new;
- (void)setStrategy:(id<SortStrategy>)strategy;
- (void)run:(int *)array count:(int)count;
@end

@implementation SortContext
+ (instancetype)new {
    SortContext *obj = (SortContext *)calloc(1, sizeof(SortContext));
    obj->isa = self;
    return obj;
}
- (void)setStrategy:(id<SortStrategy>)s {
    strategy = s;
}
- (void)run:(int *)array count:(int)count {
    printf("using %s: ", [strategy name]);
    [strategy sortArray:array count:count];
    for (int i = 0; i < count; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}
@end

int main(void) {
    int data1[] = { 5, 2, 8, 1, 9, 3 };
    int data2[] = { 5, 2, 8, 1, 9, 3 };

    SortContext *ctx = [SortContext new];

    [ctx setStrategy:[BubbleSortStrategy new]];
    [ctx run:data1 count:6];

    [ctx setStrategy:[InsertionSortStrategy new]];
    [ctx run:data2 count:6];

    return 0;
}
