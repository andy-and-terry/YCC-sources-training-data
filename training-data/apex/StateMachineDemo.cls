public class StateMachineDemo {
    public interface OrderState {
        OrderState next();
        String label();
    }

    public class OrderContext {
        public OrderState state = new PendingState();

        public void advance() {
            state = state.next();
        }
    }

    public class PendingState implements OrderState {
        public OrderState next() {
            return new ShippedState();
        }
        public String label() {
            return 'Pending';
        }
    }

    public class ShippedState implements OrderState {
        public OrderState next() {
            return new DeliveredState();
        }
        public String label() {
            return 'Shipped';
        }
    }

    public class DeliveredState implements OrderState {
        public OrderState next() {
            return this;
        }
        public String label() {
            return 'Delivered';
        }
    }

    public static void main() {
        OrderContext ctx = new OrderContext();
        for (Integer i = 0; i < 3; i++) {
            System.debug(ctx.state.label());
            ctx.advance();
        }
        System.debug(ctx.state.label());
    }
}
