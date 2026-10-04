#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *input = @[ @"red", @"green", @"red", @"blue", @"green", @"yellow" ];

        // an ordered set removes duplicates but keeps first-seen order
        NSOrderedSet *unique = [NSOrderedSet orderedSetWithArray:input];
        NSLog(@"unique: %@", unique.array);
        NSLog(@"index of blue: %lu", (unsigned long)[unique indexOfObject:@"blue"]);

        NSMutableOrderedSet *m = [unique mutableCopy];
        [m insertObject:@"purple" atIndex:1];
        [m removeObject:@"red"];
        NSLog(@"after edit: %@", m.array);

        NSOrderedSet *other = [NSOrderedSet orderedSetWithObjects:@"blue", @"black", nil];
        [m unionOrderedSet:other];
        [m intersectOrderedSet:[NSOrderedSet orderedSetWithObjects:@"blue", @"black", @"purple", nil]];
        NSLog(@"final: %@", m.array);
    }
    return 0;
}
