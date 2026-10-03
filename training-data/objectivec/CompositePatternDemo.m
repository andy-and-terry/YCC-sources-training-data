#import <Foundation/Foundation.h>

@protocol FileSystemItem <NSObject>
- (NSInteger)size;
- (NSString *)name;
@end

@interface FileLeaf : NSObject <FileSystemItem>
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger fileSize;
- (instancetype)initWithName:(NSString *)name size:(NSInteger)size;
@end

@implementation FileLeaf
- (instancetype)initWithName:(NSString *)name size:(NSInteger)size {
    self = [super init];
    if (self) { _name = name; _fileSize = size; }
    return self;
}
- (NSInteger)size { return self.fileSize; }
@end

@interface DirectoryComposite : NSObject <FileSystemItem>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray<id<FileSystemItem>> *children;
- (instancetype)initWithName:(NSString *)name;
- (void)addChild:(id<FileSystemItem>)child;
@end

@implementation DirectoryComposite
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) { _name = name; _children = [NSMutableArray array]; }
    return self;
}
- (void)addChild:(id<FileSystemItem>)child {
    [self.children addObject:child];
}
- (NSInteger)size {
    NSInteger total = 0;
    for (id<FileSystemItem> child in self.children) total += [child size];
    return total;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        DirectoryComposite *root = [[DirectoryComposite alloc] initWithName:@"root"];
        [root addChild:[[FileLeaf alloc] initWithName:@"a.txt" size:100]];

        DirectoryComposite *sub = [[DirectoryComposite alloc] initWithName:@"sub"];
        [sub addChild:[[FileLeaf alloc] initWithName:@"b.txt" size:200]];
        [sub addChild:[[FileLeaf alloc] initWithName:@"c.txt" size:300]];
        [root addChild:sub];

        NSLog(@"%ld", (long)[root size]);
    }
    return 0;
}
