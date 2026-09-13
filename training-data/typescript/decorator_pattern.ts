interface Coffee {
  cost(): number;
  description(): string;
}

class SimpleCoffee implements Coffee {
  cost(): number {
    return 2;
  }
  description(): string {
    return "coffee";
  }
}

abstract class CoffeeDecorator implements Coffee {
  constructor(protected wrapped: Coffee) {}
  cost(): number {
    return this.wrapped.cost();
  }
  description(): string {
    return this.wrapped.description();
  }
}

class MilkDecorator extends CoffeeDecorator {
  cost(): number {
    return super.cost() + 0.5;
  }
  description(): string {
    return `${super.description()} with milk`;
  }
}

class SugarDecorator extends CoffeeDecorator {
  cost(): number {
    return super.cost() + 0.25;
  }
  description(): string {
    return `${super.description()} with sugar`;
  }
}

let drink: Coffee = new SimpleCoffee();
drink = new MilkDecorator(drink);
drink = new SugarDecorator(drink);

console.log(drink.description(), drink.cost());
