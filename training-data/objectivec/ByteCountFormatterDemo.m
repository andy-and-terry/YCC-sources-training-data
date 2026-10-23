#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        long long sizes[] = {0, 512, 1500, 1048576, 5368709120LL};

        NSByteCountFormatter *file = [[NSByteCountFormatter alloc] init];
        file.countStyle = NSByteCountFormatterCountStyleFile;

        NSByteCountFormatter *memory = [[NSByteCountFormatter alloc] init];
        memory.countStyle = NSByteCountFormatterCountStyleBinary;

        for (int i = 0; i < 5; i++) {
            NSLog(@"%lld bytes -> file: %@, binary: %@",
                  sizes[i],
                  [file stringFromByteCount:sizes[i]],
                  [memory stringFromByteCount:sizes[i]]);
        }

        NSByteCountFormatter *mbOnly = [[NSByteCountFormatter alloc] init];
        mbOnly.allowedUnits = NSByteCountFormatterUseMB;
        mbOnly.includesUnit = YES;
        NSLog(@"forced MB: %@", [mbOnly stringFromByteCount:5368709120LL]);

        NSLog(@"class method: %@",
              [NSByteCountFormatter stringFromByteCount:123456789
                                             countStyle:NSByteCountFormatterCountStyleDecimal]);
    }
    return 0;
}
