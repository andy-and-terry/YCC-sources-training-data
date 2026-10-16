#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *dir = [NSTemporaryDirectory() stringByAppendingPathComponent:
                         [[NSUUID UUID] UUIDString]];
        NSError *error = nil;

        if (![fm createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"mkdir failed: %@", error);
            return 1;
        }

        NSString *file = [dir stringByAppendingPathComponent:@"note.txt"];
        [@"hello file" writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:&error];
        NSLog(@"exists: %d", [fm fileExistsAtPath:file]);

        NSDictionary *attrs = [fm attributesOfItemAtPath:file error:&error];
        NSLog(@"size: %llu", attrs.fileSize);

        NSLog(@"contents: %@", [fm contentsOfDirectoryAtPath:dir error:&error]);

        [fm removeItemAtPath:dir error:&error];
        NSLog(@"cleaned up: %d", ![fm fileExistsAtPath:dir]);
    }
    return 0;
}
