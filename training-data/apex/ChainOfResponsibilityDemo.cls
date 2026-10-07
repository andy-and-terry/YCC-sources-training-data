public class ChainOfResponsibilityDemo {
    public abstract class Approver {
        protected Approver next;

        public void setNext(Approver next) {
            this.next = next;
        }

        public void approve(Decimal amount) {
            if (canApprove(amount)) {
                System.debug(label() + ' approved amount ' + amount);
            } else if (next != null) {
                next.approve(amount);
            } else {
                System.debug('No approver available for amount ' + amount);
            }
        }

        protected abstract Boolean canApprove(Decimal amount);
        protected abstract String label();
    }

    public class Manager extends Approver {
        protected override Boolean canApprove(Decimal amount) {
            return amount <= 1000;
        }
        protected override String label() {
            return 'Manager';
        }
    }

    public class Director extends Approver {
        protected override Boolean canApprove(Decimal amount) {
            return amount <= 10000;
        }
        protected override String label() {
            return 'Director';
        }
    }

    public class VicePresident extends Approver {
        protected override Boolean canApprove(Decimal amount) {
            return amount <= 100000;
        }
        protected override String label() {
            return 'VicePresident';
        }
    }

    public static void main() {
        Approver manager = new Manager();
        Approver director = new Director();
        Approver vp = new VicePresident();

        manager.setNext(director);
        director.setNext(vp);

        manager.approve(500);
        manager.approve(5000);
        manager.approve(50000);
        manager.approve(500000);
    }
}
