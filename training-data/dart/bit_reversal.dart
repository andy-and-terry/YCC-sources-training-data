int reverseBits(int value, [int width = 8]) {
  var result = 0;
  for (var i = 0; i < width; i++) {
    result = (result << 1) | (value & 1);
    value >>= 1;
  }
  return result;
}

void main() {
  for (final v in [1, 6, 13, 128]) {
    print('$v ${reverseBits(v)}'); // 128 96 176 1
  }
}
