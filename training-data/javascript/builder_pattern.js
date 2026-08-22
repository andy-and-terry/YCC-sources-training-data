class Pizza {
  constructor() {
    this.toppings = [];
    this.size = 'medium';
  }
}

class PizzaBuilder {
  #pizza = new Pizza();

  size(size) {
    this.#pizza.size = size;
    return this;
  }

  addTopping(topping) {
    this.#pizza.toppings.push(topping);
    return this;
  }

  build() {
    return this.#pizza;
  }
}

const pizza = new PizzaBuilder().size('large').addTopping('cheese').addTopping('olives').build();
console.log(pizza);
module.exports = { PizzaBuilder };
