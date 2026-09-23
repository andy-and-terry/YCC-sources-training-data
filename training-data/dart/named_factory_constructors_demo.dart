class Color {
  final int red;
  final int green;
  final int blue;

  Color(this.red, this.green, this.blue);

  Color.black() : this(0, 0, 0);
  Color.white() : this(255, 255, 255);

  factory Color.fromHex(String hex) {
    final value = int.parse(hex.replaceFirst('#', ''), radix: 16);
    return Color(
      (value >> 16) & 0xFF,
      (value >> 8) & 0xFF,
      value & 0xFF,
    );
  }

  @override
  String toString() => 'Color($red, $green, $blue)';
}

void main() {
  print(Color.black());
  print(Color.white());
  print(Color.fromHex('#FF8000'));
}
