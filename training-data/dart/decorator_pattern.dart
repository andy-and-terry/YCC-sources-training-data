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

class MilkDecorator implements Coffee {
  final Coffee wrapped;

  MilkDecorator(this.wrapped);

  @override
  double cost() => wrapped.cost() + 0.5;

  @override
  String description() => '${wrapped.description()} + milk';
}

void main() {
  final coffee = MilkDecorator(SimpleCoffee());
  print('${coffee.description()} costs ${coffee.cost()}');
}
