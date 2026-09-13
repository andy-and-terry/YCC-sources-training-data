public class StatePattern {
    interface OrderState {
        OrderState next(OrderContext context);
        String name();
    }

    static class PendingState implements OrderState {
        public OrderState next(OrderContext context) {
            return new ShippedState();
        }
        public String name() {
            return "pending";
        }
    }

    static class ShippedState implements OrderState {
        public OrderState next(OrderContext context) {
            return new DeliveredState();
        }
        public String name() {
            return "shipped";
        }
    }

    static class DeliveredState implements OrderState {
        public OrderState next(OrderContext context) {
            return this;
        }
        public String name() {
            return "delivered";
        }
    }

    static class OrderContext {
        private OrderState state = new PendingState();

        void advance() {
            state = state.next(this);
        }

        String currentState() {
            return state.name();
        }
    }

    public static void main(String[] args) {
        OrderContext order = new OrderContext();
        for (int i = 0; i < 4; i++) {
            System.out.println(order.currentState());
            order.advance();
        }
    }
}
