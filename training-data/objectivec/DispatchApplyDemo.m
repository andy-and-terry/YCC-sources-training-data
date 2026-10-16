#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        const size_t count = 8;
        NSInteger results[8] = {0};

        dispatch_apply(count, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(size_t i) {
            results[i] = (NSInteger)(i * i);
        });

        NSInteger total = 0;
        for (size_t i = 0; i < count; i++) {
            NSLog(@"squares[%zu] = %ld", i, (long)results[i]);
            total += results[i];
        }
        NSLog(@"sum of squares: %ld", (long)total);
    }
    return 0;
}
