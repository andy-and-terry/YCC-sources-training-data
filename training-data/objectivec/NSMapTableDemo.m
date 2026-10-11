#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMapTable<NSString *, NSNumber *> *table = [NSMapTable strongToStrongObjectsMapTable];
        [table setObject:@1 forKey:@"one"];
        [table setObject:@2 forKey:@"two"];
        NSLog(@"count: %lu", (unsigned long)table.count);
        NSLog(@"two: %@", [table objectForKey:@"two"]);

        NSMapTable *weakValues = [NSMapTable strongToWeakObjectsMapTable];
        @autoreleasepool {
            NSObject *temp = [NSObject new];
            [weakValues setObject:temp forKey:@"temp"];
            NSLog(@"inside scope: %@", [weakValues objectForKey:@"temp"] ? @"alive" : @"gone");
        }

        NSDictionary *snapshot = [table dictionaryRepresentation];
        NSLog(@"snapshot keys: %@", [snapshot.allKeys sortedArrayUsingSelector:@selector(compare:)]);

        [table removeObjectForKey:@"one"];
        NSLog(@"after remove: %lu", (unsigned long)table.count);
    }
    return 0;
}
