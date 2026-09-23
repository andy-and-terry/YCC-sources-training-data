#import <Foundation/Foundation.h>

// The template method pattern defines the skeleton of an algorithm in a
// base class method and lets subclasses override individual steps
// without changing the overall structure or order of the steps.
@interface ReportGenerator : NSObject
- (void)generateReport;
- (NSString *)fetchData;
- (NSString *)formatData:(NSString *)data;
- (void)deliver:(NSString *)formatted;
@end

@implementation ReportGenerator
// This is the template method: the fixed sequence every subclass shares.
- (void)generateReport {
    NSString *data = [self fetchData];
    NSString *formatted = [self formatData:data];
    [self deliver:formatted];
}

- (NSString *)fetchData {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (NSString *)formatData:(NSString *)data {
    return data;
}

- (void)deliver:(NSString *)formatted {
    NSLog(@"delivering report:\n%@", formatted);
}
@end

@interface SalesReportGenerator : ReportGenerator
@end

@implementation SalesReportGenerator
- (NSString *)fetchData {
    return @"sales: 100, 200, 150";
}

- (NSString *)formatData:(NSString *)data {
    return [NSString stringWithFormat:@"=== Sales Report ===\n%@", data];
}
@end

@interface InventoryReportGenerator : ReportGenerator
@end

@implementation InventoryReportGenerator
- (NSString *)fetchData {
    return @"widgets: 42, gadgets: 7";
}

- (NSString *)formatData:(NSString *)data {
    return [NSString stringWithFormat:@"=== Inventory Report ===\n%@", data];
}

// This subclass also customizes delivery, showing that a template
// method's steps are independent hooks, not all-or-nothing.
- (void)deliver:(NSString *)formatted {
    NSLog(@"emailing inventory report:\n%@", formatted);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        ReportGenerator *sales = [[SalesReportGenerator alloc] init];
        ReportGenerator *inventory = [[InventoryReportGenerator alloc] init];
        [sales generateReport];
        [inventory generateReport];
    }
    return 0;
}
