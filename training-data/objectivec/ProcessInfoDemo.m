#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSProcessInfo *info = [NSProcessInfo processInfo];

        NSLog(@"process: %@", info.processName);
        NSLog(@"args: %lu", (unsigned long)info.arguments.count);
        NSLog(@"cores: %d", info.processorCount > 0);
        NSLog(@"physical memory > 0: %d", info.physicalMemory > 0);

        NSString *home = info.environment[@"HOME"];
        NSLog(@"HOME set: %d", home != nil);

        NSTimeInterval uptime = info.systemUptime;
        NSLog(@"uptime positive: %d", uptime > 0);

        NSString *host = info.hostName;
        NSLog(@"host name length > 0: %d", host.length > 0);
    }
    return 0;
}
