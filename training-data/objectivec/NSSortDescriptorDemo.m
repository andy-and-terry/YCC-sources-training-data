#import <Foundation/Foundation.h>

int main(void) {
  @autoreleasepool {
    NSArray *people = @[
      @{@"name": @"Ann", @"age": @30},
      @{@"name": @"Bob", @"age": @25},
      @{@"name": @"Cid", @"age": @30},
    ];
    NSSortDescriptor *byAge = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    NSSortDescriptor *byName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    for (NSDictionary *p in [people sortedArrayUsingDescriptors:@[byAge, byName]])
      NSLog(@"%@ %@", p[@"name"], p[@"age"]);
  }
  return 0;
}
