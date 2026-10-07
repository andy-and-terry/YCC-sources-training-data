#import <Foundation/Foundation.h>

// Each handler either resolves a request or passes it to the next
// handler in the chain, so the sender does not need to know which
// handler will ultimately deal with it.
typedef NS_ENUM(NSInteger, TicketSeverity) {
    TicketSeverityLow,
    TicketSeverityMedium,
    TicketSeverityHigh
};

@interface SupportHandler : NSObject
@property (nonatomic, strong) SupportHandler *next;
- (void)handleTicket:(TicketSeverity)severity description:(NSString *)description;
@end

@implementation SupportHandler
- (void)handleTicket:(TicketSeverity)severity description:(NSString *)description {
    if (self.next) [self.next handleTicket:severity description:description];
}
@end

@interface FrontLineSupport : SupportHandler
@end

@implementation FrontLineSupport
- (void)handleTicket:(TicketSeverity)severity description:(NSString *)description {
    if (severity == TicketSeverityLow) {
        NSLog(@"front line resolves: %@", description);
    } else {
        NSLog(@"front line escalates: %@", description);
        [super handleTicket:severity description:description];
    }
}
@end

@interface EngineeringSupport : SupportHandler
@end

@implementation EngineeringSupport
- (void)handleTicket:(TicketSeverity)severity description:(NSString *)description {
    if (severity == TicketSeverityMedium) {
        NSLog(@"engineering resolves: %@", description);
    } else {
        NSLog(@"engineering escalates: %@", description);
        [super handleTicket:severity description:description];
    }
}
@end

@interface ManagementSupport : SupportHandler
@end

@implementation ManagementSupport
- (void)handleTicket:(TicketSeverity)severity description:(NSString *)description {
    NSLog(@"management resolves: %@", description);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        FrontLineSupport *frontLine = [[FrontLineSupport alloc] init];
        EngineeringSupport *engineering = [[EngineeringSupport alloc] init];
        ManagementSupport *management = [[ManagementSupport alloc] init];
        frontLine.next = engineering;
        engineering.next = management;

        [frontLine handleTicket:TicketSeverityLow description:@"forgot password"];
        [frontLine handleTicket:TicketSeverityMedium description:@"server slow"];
        [frontLine handleTicket:TicketSeverityHigh description:@"data loss"];
    }
    return 0;
}
