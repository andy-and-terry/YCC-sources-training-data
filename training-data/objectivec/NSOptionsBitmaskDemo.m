#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, FilePermission) {
    FilePermissionNone    = 0,
    FilePermissionRead    = 1 << 0,
    FilePermissionWrite   = 1 << 1,
    FilePermissionExecute = 1 << 2
};

NSString *describePermissions(FilePermission p) {
    NSMutableArray<NSString *> *parts = [NSMutableArray array];
    if (p & FilePermissionRead) [parts addObject:@"read"];
    if (p & FilePermissionWrite) [parts addObject:@"write"];
    if (p & FilePermissionExecute) [parts addObject:@"execute"];
    return parts.count ? [parts componentsJoinedByString:@"|"] : @"none";
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        FilePermission p = FilePermissionRead | FilePermissionWrite;
        NSLog(@"%@", describePermissions(p));

        p |= FilePermissionExecute;
        NSLog(@"%@", describePermissions(p));

        p &= ~FilePermissionWrite;
        NSLog(@"%@", describePermissions(p));

        NSLog(@"can write: %d", (p & FilePermissionWrite) != 0);
        NSLog(@"%@", describePermissions(FilePermissionNone));
    }
    return 0;
}
