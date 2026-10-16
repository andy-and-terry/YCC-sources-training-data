void main () {
    int n = 255;
    double pi = Math.PI;
    stdout.printf ("dec: %d\n", n);
    stdout.printf ("hex: %x / %X / 0x%04x\n", n, n, n);
    stdout.printf ("oct: %o\n", n);
    stdout.printf ("width: [%8d] [%-8d] [%08d]\n", n, n, n);
    stdout.printf ("float: %.3f %e %g\n", pi, pi, pi);
    stdout.printf ("long: %lld\n", 9876543210LL);
    stdout.printf ("char: %c\n", 'Z');
    stdout.printf ("percent: %d%%\n", 50);
}
