#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSExpression *expr = [NSExpression expressionWithFormat:@"(3 + 4) * 5"];
        NSLog(@"(3 + 4) * 5 = %@", [expr expressionValueWithObject:nil context:nil]);

        NSExpression *template = [NSExpression expressionWithFormat:@"$x * $x + 1"];
        NSExpression *bound = [template expressionWithSubstitutionVariables:@{@"x": @7}];
        NSLog(@"with variable: %@", [bound expressionValueWithObject:nil context:nil]);

        NSExpression *fn = [NSExpression expressionWithFormat:@"max:({4, 9, 2})"];
        NSLog(@"max: %@", [fn expressionValueWithObject:nil context:nil]);
    }
    return 0;
}
