class Pizza {
  toppings: string[] = [];
  size = 'medium';
}

class PizzaBuilder {
  private pizza = new Pizza();

  size(size: string): this {
    this.pizza.size = size;
    return this;
  }

  addTopping(topping: string): this {
    this.pizza.toppings.push(topping);
    return this;
  }

  build(): Pizza {
    return this.pizza;
  }
}

const pizza = new PizzaBuilder().size('large').addTopping('cheese').addTopping('olives').build();
console.log(pizza);
