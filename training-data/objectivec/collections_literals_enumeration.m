#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray *a = @[@"b", @"a", @"c"];
        NSDictionary *d = @{@"x": @1, @"y": @2};
        NSMutableArray *m = [a mutableCopy];
        [m addObject:@"d"];
        [m removeObjectAtIndex:0];
        [m insertObject:@"z" atIndex:1];
        NSLog(@"%@ %lu %@", m, (unsigned long)m.count, [m indexOfObject:@"a"] != NSNotFound ? @"found" : @"no");
        NSLog(@"%@", [a sortedArrayUsingSelector:@selector(compare:)]);
        NSLog(@"%@ %@", d[@"x"], [d allKeys].count == 2 ? @"two" : @"?");
        for (NSString *s in a) NSLog(@"item %@", s);
        [d enumerateKeysAndObjectsUsingBlock:^(id k, id v, BOOL *stop) { NSLog(@"%@=%@", k, v); }];
        NSSet *set = [NSSet setWithArray:@[@1, @2, @2]];
        NSLog(@"%lu %d", (unsigned long)set.count, [set containsObject:@2]);
        NSMutableDictionary *md = [NSMutableDictionary dictionary];
        md[@"k"] = @"v";
        [md removeObjectForKey:@"zz"];
        NSLog(@"%@", [a componentsJoinedByString:@","]);
        NSLog(@"%@", [a filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != 'a'"]]);
    }
    return 0;
}
