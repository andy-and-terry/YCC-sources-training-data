#import <Foundation/Foundation.h>

@protocol DownloadDelegate <NSObject>
- (void)didFinish:(NSString *)name;
@end

@interface Downloader : NSObject
@property (weak) id<DownloadDelegate> delegate;
- (void)run;
@end

@implementation Downloader
- (void)run { [self.delegate didFinish:@"file.zip"]; }
@end

@interface Owner : NSObject <DownloadDelegate>
@end
@implementation Owner
- (void)didFinish:(NSString *)name { NSLog(@"done %@", name); }
@end

int main(void) {
    @autoreleasepool {
        Owner *o = [Owner new];
        Downloader *d = [Downloader new];
        d.delegate = o;
        [d run];
    }
    return 0;
}
