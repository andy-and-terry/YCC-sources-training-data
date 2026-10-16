#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSHashTable<NSString *> *strong = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        [strong addObject:@"alpha"];
        [strong addObject:@"beta"];
        [strong addObject:@"alpha"];
        NSLog(@"count: %lu", (unsigned long)strong.count);
        NSLog(@"contains beta: %d", [strong containsObject:@"beta"]);

        NSHashTable *observers = [NSHashTable weakObjectsHashTable];
        NSObject *a = [NSObject new];
        NSObject *b = [NSObject new];
        [observers addObject:a];
        [observers addObject:b];
        NSLog(@"weak table count: %lu", (unsigned long)observers.count);

        for (NSObject *o in observers.allObjects) {
            NSLog(@"observer: %@", [o class]);
        }
        [observers removeObject:a];
        NSLog(@"after remove: %lu", (unsigned long)observers.count);
    }
    return 0;
}
