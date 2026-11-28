#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        enum { N = 7 };
        long d[N + 1][N + 1];
        for (int i = 0; i <= N; i++) for (int j = 0; j <= N; j++) d[i][j] = (i == 0 || j == 0) ? 1 : d[i-1][j] + d[i][j-1] + d[i-1][j-1];
        NSMutableArray *diag = [NSMutableArray array];
        for (int i = 0; i <= N; i++) [diag addObject:@(d[i][i])];
        NSLog(@"%@", [diag componentsJoinedByString:@" "]);
    }
    return 0;
}
