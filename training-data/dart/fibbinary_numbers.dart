// Fibbinary numbers: no two adjacent 1 bits.
void main() {
  print([for (var n = 0; n < 50; n++) if (n & (n >> 1) == 0) n].join(' '));
}
