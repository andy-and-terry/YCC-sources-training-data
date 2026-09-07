class Coffee {
  cost() {
    return 4;
  }
  describe() {
    return 'coffee';
  }
}

class MilkDecorator {
  constructor(beverage) {
    this.beverage = beverage;
  }
  cost() {
    return this.beverage.cost() + 1;
  }
  describe() {
    return `${this.beverage.describe()} + milk`;
  }
}

class SyrupDecorator {
  constructor(beverage) {
    this.beverage = beverage;
  }
  cost() {
    return this.beverage.cost() + 0.5;
  }
  describe() {
    return `${this.beverage.describe()} + syrup`;
  }
}

let order = new Coffee();
order = new MilkDecorator(order);
order = new SyrupDecorator(order);
console.log(order.describe(), order.cost());
module.exports = { Coffee, MilkDecorator, SyrupDecorator };
