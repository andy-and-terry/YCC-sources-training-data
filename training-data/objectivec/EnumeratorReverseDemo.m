#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *items = @[ @"one", @"two", @"three", @"four" ];

        // NSEnumerator gives pull-style iteration over any collection.
        NSEnumerator *forward = [items objectEnumerator];
        NSString *item;
        while ((item = [forward nextObject])) {
            NSLog(@"forward: %@", item);
        }

        NSEnumerator *backward = [items reverseObjectEnumerator];
        NSLog(@"backward all: %@", [backward allObjects]);

        // Dictionaries expose separate key and value enumerators.
        NSDictionary<NSString *, NSNumber *> *ages = @{ @"ann": @31, @"bob": @27 };
        NSEnumerator *keys = [[ages allKeys] objectEnumerator];
        NSString *key;
        while ((key = [keys nextObject])) {
            NSLog(@"%@ is %@", key, ages[key]);
        }

        // enumerateObjectsWithOptions can walk in reverse and stop early.
        [items enumerateObjectsWithOptions:NSEnumerationReverse
                                usingBlock:^(NSString *s, NSUInteger i, BOOL *stop) {
            NSLog(@"[%lu] %@", (unsigned long)i, s);
            if (i == 2) *stop = YES;
        }];
    }
    return 0;
}
