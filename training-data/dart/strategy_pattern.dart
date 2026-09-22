abstract class DiscountStrategy {
  double apply(double total);
}

class NoDiscount implements DiscountStrategy {
  @override
  double apply(double total) => total;
}

class PercentageDiscount implements DiscountStrategy {
  final double percent;
  PercentageDiscount(this.percent);

  @override
  double apply(double total) => total - (total * percent / 100.0);
}

class FlatDiscount implements DiscountStrategy {
  final double amount;
  FlatDiscount(this.amount);

  @override
  double apply(double total) {
    final result = total - amount;
    return result < 0 ? 0 : result;
  }
}

class Cart {
  final DiscountStrategy strategy;
  Cart(this.strategy);

  double checkout(double total) => strategy.apply(total);
}

void main() {
  print(Cart(NoDiscount()).checkout(100.0));
  print(Cart(PercentageDiscount(20.0)).checkout(100.0));
  print(Cart(FlatDiscount(15.0)).checkout(100.0));
}
