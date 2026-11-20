#import <Foundation/Foundation.h>

// Shoelace polygon area with C structs.
typedef struct { double x, y; } Pt;

int main(void) {
    @autoreleasepool {
        Pt p[] = {{0, 0}, {4, 0}, {4, 3}, {0, 3}};
        double s = 0;
        for (int i = 0; i < 4; i++) {
            Pt q = p[(i + 1) % 4];
            s += p[i].x * q.y - q.x * p[i].y;
        }
        NSLog(@"%.1f", fabs(s) / 2);
    }
    return 0;
}
