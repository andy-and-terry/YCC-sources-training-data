#import <Foundation/Foundation.h>

@protocol DownloadDelegate <NSObject>
- (void)didFinish:(NSString *)name;
@end

@interface Downloader : NSObject
@property (weak) id<DownloadDelegate> delegate;
- (void)run;
@end
@implementation Downloader
- (void)run { [self.delegate didFinish:@"file.txt"]; }
@end

@interface Handler : NSObject <DownloadDelegate> @end
@implementation Handler
- (void)didFinish:(NSString *)name { NSLog(@"finished %@", name); }
@end

int main(void) {
    @autoreleasepool {
        Handler *h = [Handler new];
        Downloader *d = [Downloader new];
        d.delegate = h;
        [d run];
    }
    return 0;
}
