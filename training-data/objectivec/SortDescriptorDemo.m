#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSDictionary *> *rows = @[
            @{ @"name": @"Cleo", @"dept": @"eng", @"salary": @120 },
            @{ @"name": @"Ada",  @"dept": @"eng", @"salary": @150 },
            @{ @"name": @"Bob",  @"dept": @"ops", @"salary": @90 },
            @{ @"name": @"Dan",  @"dept": @"ops", @"salary": @90 },
        ];

        NSSortDescriptor *byDept = [NSSortDescriptor sortDescriptorWithKey:@"dept" ascending:YES];
        NSSortDescriptor *bySalary = [NSSortDescriptor sortDescriptorWithKey:@"salary" ascending:NO];
        NSSortDescriptor *byName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES
                                                                  selector:@selector(caseInsensitiveCompare:)];

        NSArray *sorted = [rows sortedArrayUsingDescriptors:@[ byDept, bySalary, byName ]];
        for (NSDictionary *row in sorted) {
            NSLog(@"%@ %@ %@", row[@"dept"], row[@"salary"], row[@"name"]);
        }
    }
    return 0;
}
