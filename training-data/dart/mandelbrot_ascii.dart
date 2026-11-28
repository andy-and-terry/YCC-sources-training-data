int escape(double cr, double ci) {
  var zr = 0.0, zi = 0.0;
  for (var n = 0; n < 30; n++) {
    if (zr * zr + zi * zi >= 4) return n;
    final t = zr * zr - zi * zi + cr;
    zi = 2 * zr * zi + ci;
    zr = t;
  }
  return 30;
}

void main() {
  for (var yi = -5; yi <= 5; yi++) {
    print([for (var xi = -40; xi <= 12; xi++) escape(xi / 20, yi / 5) == 30 ? '#' : '.'].join());
  }
}
