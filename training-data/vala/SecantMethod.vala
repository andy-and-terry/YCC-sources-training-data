delegate double Fn (double x);

double secant (Fn f, double a, double b) {
    for (int i = 0; i < 40; i++) {
        double fa = f (a), fb = f (b);
        if (fa == fb) break;
        double c = b - fb * (b - a) / (fb - fa);
        a = b;
        b = c;
    }
    return b;
}

void main () {
    print ("%.8f\n", secant ((x) => x * x - 2, 1, 2));
}
