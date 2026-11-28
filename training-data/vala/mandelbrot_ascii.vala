int escape (double cr, double ci) {
    double zr = 0, zi = 0;
    for (int n = 0; n < 30; n++) {
        if (zr * zr + zi * zi >= 4) return n;
        double t = zr * zr - zi * zi + cr;
        zi = 2 * zr * zi + ci;
        zr = t;
    }
    return 30;
}

void main () {
    for (int yi = -5; yi <= 5; yi++) {
        var sb = new StringBuilder ();
        for (int xi = -40; xi <= 12; xi++)
            sb.append (escape (xi / 20.0, yi / 5.0) == 30 ? "#" : ".");
        print ("%s\n", sb.str);
    }
}
