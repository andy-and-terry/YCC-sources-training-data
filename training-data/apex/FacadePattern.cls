public class FacadePattern {
    public class InventorySystem {
        public Boolean hasStock(String item) {
            return true;
        }
    }

    public class PaymentSystem {
        public Boolean charge(String item, Decimal amount) {
            return true;
        }
    }

    public class ShippingSystem {
        public void ship(String item) {
            System.debug('Shipping ' + item);
        }
    }

    // Facade hides the coordination of three subsystems behind one call.
    public class OrderFacade {
        private InventorySystem inventory = new InventorySystem();
        private PaymentSystem payment = new PaymentSystem();
        private ShippingSystem shipping = new ShippingSystem();

        public Boolean placeOrder(String item, Decimal amount) {
            if (!inventory.hasStock(item)) {
                return false;
            }
            if (!payment.charge(item, amount)) {
                return false;
            }
            shipping.ship(item);
            return true;
        }
    }

    public static void main() {
        OrderFacade facade = new OrderFacade();
        System.debug(facade.placeOrder('Widget', 19.99));
    }
}
