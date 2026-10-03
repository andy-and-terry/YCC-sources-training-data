#import <Foundation/Foundation.h>

@protocol ImageLoader <NSObject>
- (void)display;
@end

@interface RealImage : NSObject <ImageLoader>
@property (nonatomic, strong) NSString *filename;
- (instancetype)initWithFilename:(NSString *)filename;
@end

@implementation RealImage
- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self) {
        _filename = filename;
        NSLog(@"Loading %@ from disk", filename);
    }
    return self;
}
- (void)display {
    NSLog(@"Displaying %@", self.filename);
}
@end

// The proxy defers the expensive load until the image is actually displayed.
@interface ImageProxy : NSObject <ImageLoader>
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) RealImage *realImage;
- (instancetype)initWithFilename:(NSString *)filename;
@end

@implementation ImageProxy
- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self) _filename = filename;
    return self;
}
- (void)display {
    if (!self.realImage) {
        self.realImage = [[RealImage alloc] initWithFilename:self.filename];
    }
    [self.realImage display];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        id<ImageLoader> image = [[ImageProxy alloc] initWithFilename:@"photo.png"];
        NSLog(@"Proxy created, image not loaded yet");
        [image display];
        [image display];
    }
    return 0;
}
