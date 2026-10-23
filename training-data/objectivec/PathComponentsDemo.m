#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *path = @"/usr/local/share/docs/report.final.pdf";

        NSLog(@"components: %@", path.pathComponents);
        NSLog(@"last: %@", path.lastPathComponent);
        NSLog(@"extension: %@", path.pathExtension);
        NSLog(@"without extension: %@", path.stringByDeletingPathExtension);
        NSLog(@"parent: %@", path.stringByDeletingLastPathComponent);

        // Build paths without worrying about duplicate slashes.
        NSString *base = @"/tmp/";
        NSString *joined = [base stringByAppendingPathComponent:@"out"];
        joined = [joined stringByAppendingPathComponent:@"log.txt"];
        NSLog(@"joined: %@", joined);

        NSString *renamed = [[joined stringByDeletingPathExtension]
                             stringByAppendingPathExtension:@"csv"];
        NSLog(@"renamed: %@", renamed);

        // Collapse "." and ".." segments.
        NSLog(@"standardized: %@", @"/a/b/../c/./d".stringByStandardizingPath);
        NSLog(@"is absolute: %d", path.isAbsolutePath);
    }
    return 0;
}
