class OrderState {
  next(order) {
    throw new Error('not implemented');
  }
  name() {
    throw new Error('not implemented');
  }
}

class PlacedState extends OrderState {
  next(order) {
    order.state = new ShippedState();
  }
  name() {
    return 'placed';
  }
}

class ShippedState extends OrderState {
  next(order) {
    order.state = new DeliveredState();
  }
  name() {
    return 'shipped';
  }
}

class DeliveredState extends OrderState {
  next() {
    throw new Error('order already delivered');
  }
  name() {
    return 'delivered';
  }
}

class Order {
  constructor() {
    this.state = new PlacedState();
  }

  advance() {
    this.state.next(this);
    return this.state.name();
  }
}

const order = new Order();
console.log(order.state.name());
console.log(order.advance());
console.log(order.advance());
module.exports = { Order, PlacedState, ShippedState, DeliveredState };
