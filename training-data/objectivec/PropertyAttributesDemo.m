#import <Foundation/Foundation.h>

@interface Document : NSObject
@property (nonatomic, copy) NSString *title;          // copied on assignment
@property (nonatomic, strong) NSMutableArray *pages;
@property (nonatomic, readonly) NSUInteger pageCount; // computed
@property (nonatomic, getter=isPublished) BOOL published;
@end

@implementation Document
- (NSUInteger)pageCount { return self.pages.count; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableString *source = [NSMutableString stringWithString:@"Draft"];
        Document *doc = [[Document alloc] init];
        doc.title = source;
        doc.pages = [NSMutableArray arrayWithObjects:@"p1", @"p2", nil];
        doc.published = YES;

        [source appendString:@" (edited)"];
        NSLog(@"source: %@", source);
        NSLog(@"title kept its own copy: %@", doc.title);
        NSLog(@"pages: %lu published: %d", (unsigned long)doc.pageCount, [doc isPublished]);
    }
    return 0;
}
