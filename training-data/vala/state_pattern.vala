interface OrderState : Object {
    public abstract string name();
    public abstract void next(OrderContext order);
}

class NewState : Object, OrderState {
    public string name() { return "New"; }
    public void next(OrderContext order) {
        order.state = new PaidState();
    }
}

class PaidState : Object, OrderState {
    public string name() { return "Paid"; }
    public void next(OrderContext order) {
        order.state = new ShippedState();
    }
}

class ShippedState : Object, OrderState {
    public string name() { return "Shipped"; }
    public void next(OrderContext order) {
        stdout.printf("already shipped, no further transitions\n");
    }
}

class OrderContext : Object {
    public OrderState state;

    public OrderContext() {
        state = new NewState();
    }

    public void advance() {
        state.next(this);
    }

    public string status() {
        return state.name();
    }
}

void main() {
    var order = new OrderContext();
    stdout.printf("%s\n", order.status());
    order.advance();
    stdout.printf("%s\n", order.status());
    order.advance();
    stdout.printf("%s\n", order.status());
    order.advance();
    stdout.printf("%s\n", order.status());
}
