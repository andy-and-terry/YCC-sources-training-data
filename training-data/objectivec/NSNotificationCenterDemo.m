#import <Foundation/Foundation.h>

int main(void) {
  @autoreleasepool {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    id token = [nc addObserverForName:@"Ping" object:nil queue:nil
                           usingBlock:^(NSNotification *n) {
      NSLog(@"got %@ with %@", n.name, n.userInfo[@"n"]);
    }];
    [nc postNotificationName:@"Ping" object:nil userInfo:@{@"n": @1}];
    [nc removeObserver:token];
    [nc postNotificationName:@"Ping" object:nil userInfo:@{@"n": @2}];
  }
  return 0;
}
