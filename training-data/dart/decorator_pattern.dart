abstract class Coffee {
  double cost();
  String description();
}

class SimpleCoffee implements Coffee {
  @override
  double cost() => 2.0;

  @override
  String description() => 'coffee';
}

abstract class CoffeeDecorator implements Coffee {
  final Coffee inner;
  CoffeeDecorator(this.inner);
}

class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee inner) : super(inner);

  @override
  double cost() => inner.cost() + 0.5;

  @override
  String description() => '${inner.description()} + milk';
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee inner) : super(inner);

  @override
  double cost() => inner.cost() + 0.25;

  @override
  String description() => '${inner.description()} + sugar';
}

void main() {
  Coffee order = SugarDecorator(MilkDecorator(SimpleCoffee()));
  print('${order.description()} = ${order.cost()}');
}
