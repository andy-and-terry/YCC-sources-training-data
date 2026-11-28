#import <Foundation/Foundation.h>

static int escapeTime(double cr, double ci) {
    double zr = 0, zi = 0;
    for (int n = 0; n < 30; n++) {
        if (zr * zr + zi * zi >= 4) return n;
        double t = zr * zr - zi * zi + cr;
        zi = 2 * zr * zi + ci;
        zr = t;
    }
    return 30;
}

int main(void) {
    @autoreleasepool {
        for (int yi = -5; yi <= 5; yi++) {
            NSMutableString *line = [NSMutableString string];
            for (int xi = -40; xi <= 12; xi++)
                [line appendString:escapeTime(xi / 20.0, yi / 5.0) == 30 ? @"#" : @"."];
            puts(line.UTF8String);
        }
    }
    return 0;
}
