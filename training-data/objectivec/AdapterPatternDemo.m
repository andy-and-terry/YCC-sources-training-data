#import <Foundation/Foundation.h>

// The interface the client code expects.
@protocol JSONExporter <NSObject>
- (NSString *)exportAsJSON;
@end

// An existing, incompatible class we cannot (or do not want to) modify.
@interface LegacyXMLReport : NSObject
- (NSString *)renderXML;
@end

@implementation LegacyXMLReport
- (NSString *)renderXML {
    return @"<report><total>42</total></report>";
}
@end

// The adapter wraps the incompatible class and exposes the interface the
// client actually needs, translating between the two on each call.
@interface XMLToJSONAdapter : NSObject <JSONExporter>
@property (nonatomic, strong) LegacyXMLReport *legacyReport;
- (instancetype)initWithLegacyReport:(LegacyXMLReport *)legacyReport;
@end

@implementation XMLToJSONAdapter
- (instancetype)initWithLegacyReport:(LegacyXMLReport *)legacyReport {
    self = [super init];
    if (self) _legacyReport = legacyReport;
    return self;
}

- (NSString *)exportAsJSON {
    NSString *xml = [self.legacyReport renderXML];
    NSString *total = @"42";
    if ([xml rangeOfString:@"<total>"].location != NSNotFound) {
        NSRange start = [xml rangeOfString:@"<total>"];
        NSRange end = [xml rangeOfString:@"</total>"];
        NSRange totalRange = NSMakeRange(start.location + start.length, end.location - (start.location + start.length));
        total = [xml substringWithRange:totalRange];
    }
    return [NSString stringWithFormat:@"{\"total\": %@}", total];
}
@end

void printAsJSON(id<JSONExporter> exporter) {
    NSLog(@"%@", [exporter exportAsJSON]);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        LegacyXMLReport *legacy = [[LegacyXMLReport alloc] init];
        XMLToJSONAdapter *adapter = [[XMLToJSONAdapter alloc] initWithLegacyReport:legacy];
        printAsJSON(adapter);
    }
    return 0;
}
