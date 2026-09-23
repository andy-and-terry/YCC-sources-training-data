#import <Foundation/Foundation.h>

// The proxy stands in for a real (expensive to create) object, sharing its
// interface and creating it only on first use (lazy loading), while also
// logging every access.
@protocol ImageLoader <NSObject>
- (NSString *)display;
@end

@interface RealImage : NSObject <ImageLoader>
@property (nonatomic, copy) NSString *filename;
- (instancetype)initWithFilename:(NSString *)filename;
@end
@implementation RealImage
- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self) {
        _filename = filename;
        NSLog(@"loading %@ from disk", filename);
    }
    return self;
}
- (NSString *)display { return [NSString stringWithFormat:@"showing %@", self.filename]; }
@end

@interface ImageProxy : NSObject <ImageLoader>
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, strong) RealImage *realImage;
- (instancetype)initWithFilename:(NSString *)filename;
@end
@implementation ImageProxy
- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self) _filename = filename;
    return self;
}
- (NSString *)display {
    if (self.realImage == nil) {
        self.realImage = [[RealImage alloc] initWithFilename:self.filename];
    }
    return [self.realImage display];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        id<ImageLoader> proxy = [[ImageProxy alloc] initWithFilename:@"photo.png"];
        NSLog(@"proxy created, image not loaded yet");
        NSLog(@"%@", [proxy display]);
        NSLog(@"%@", [proxy display]);
    }
    return 0;
}
