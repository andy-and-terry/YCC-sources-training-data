class IdGenerator {
  static int _next = 1;
  static const String prefix = 'ID';

  final String id;

  IdGenerator() : id = '$prefix-${_next++}';

  static int get issued => _next - 1;

  static void reset() => _next = 1;
}

class MathUtil {
  MathUtil._();

  static double circleArea(double r) => 3.14159 * r * r;
  static int clamp(int v, int lo, int hi) => v < lo ? lo : (v > hi ? hi : v);
}

void main() {
  final a = IdGenerator();
  final b = IdGenerator();
  print('${a.id} ${b.id}');
  print(IdGenerator.issued);

  IdGenerator.reset();
  print(IdGenerator().id);

  print(MathUtil.circleArea(2));
  print(MathUtil.clamp(15, 0, 10));
}
