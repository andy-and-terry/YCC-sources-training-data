abstract class Coffee {
  String description();
  double cost();
}

class SimpleCoffee implements Coffee {
  @override
  String description() => 'coffee';

  @override
  double cost() => 2.0;
}

abstract class CoffeeDecorator implements Coffee {
  final Coffee wrapped;
  CoffeeDecorator(this.wrapped);
}

class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(super.wrapped);

  @override
  String description() => '${wrapped.description()} with milk';

  @override
  double cost() => wrapped.cost() + 0.5;
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(super.wrapped);

  @override
  String description() => '${wrapped.description()} with sugar';

  @override
  double cost() => wrapped.cost() + 0.25;
}

void main() {
  Coffee coffee = SimpleCoffee();
  coffee = MilkDecorator(coffee);
  coffee = SugarDecorator(coffee);

  print('${coffee.description()}: \$${coffee.cost().toStringAsFixed(2)}');
}
