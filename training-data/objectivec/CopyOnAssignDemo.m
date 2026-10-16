#import <Foundation/Foundation.h>

@interface Holder : NSObject
@property (nonatomic, copy) NSString *copied;
@property (nonatomic, strong) NSString *strongRef;
@end

@implementation Holder
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableString *source = [NSMutableString stringWithString:@"original"];

        Holder *h = [[Holder alloc] init];
        h.copied = source;
        h.strongRef = source;

        [source appendString:@" + changed"];

        NSLog(@"copy property:   %@", h.copied);
        NSLog(@"strong property: %@", h.strongRef);
        NSLog(@"same object as source: copied=%d strong=%d",
              h.copied == source, h.strongRef == source);

        NSArray *original = @[[NSMutableString stringWithString:@"x"]];
        NSArray *shallow = [original copy];
        NSLog(@"shallow copy shares elements: %d", shallow[0] == original[0]);
    }
    return 0;
}
