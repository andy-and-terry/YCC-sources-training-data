class Pizza {
  final String size;
  final List<String> toppings;

  Pizza._(this.size, this.toppings);

  @override
  String toString() => '$size pizza with ${toppings.join(', ')}';
}

class PizzaBuilder {
  String _size = 'medium';
  final List<String> _toppings = [];

  PizzaBuilder size(String size) {
    _size = size;
    return this;
  }

  PizzaBuilder addTopping(String topping) {
    _toppings.add(topping);
    return this;
  }

  Pizza build() => Pizza._(_size, List.unmodifiable(_toppings));
}

void main() {
  final pizza = PizzaBuilder()
      .size('large')
      .addTopping('cheese')
      .addTopping('mushroom')
      .build();

  print(pizza);
}
