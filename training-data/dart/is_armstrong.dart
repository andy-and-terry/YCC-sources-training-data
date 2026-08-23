bool isArmstrong(int n) {
  final digits = n.toString().split('').map(int.parse).toList();
  final power = digits.length;
  final sum = digits.fold(0, (acc, d) => acc + (d.toDouble().pow(power)).round());
  return sum == n;
}

extension on double {
  double pow(int exp) {
    var result = 1.0;
    for (var i = 0; i < exp; i++) result *= this;
    return result;
  }
}

void main() {
  print(isArmstrong(153));
  print(isArmstrong(123));
}
