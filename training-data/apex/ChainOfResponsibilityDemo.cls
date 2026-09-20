public class ChainOfResponsibilityDemo {
    public abstract class ApprovalHandler {
        protected ApprovalHandler next;

        public ApprovalHandler setNext(ApprovalHandler next) {
            this.next = next;
            return next;
        }

        public void handle(Decimal amount) {
            if (canApprove(amount)) {
                System.debug(approverName() + ' approved $' + amount);
            } else if (next != null) {
                next.handle(amount);
            } else {
                System.debug('No approver found for $' + amount);
            }
        }

        protected abstract Boolean canApprove(Decimal amount);
        protected abstract String approverName();
    }

    public class Manager extends ApprovalHandler {
        protected override Boolean canApprove(Decimal amount) {
            return amount <= 1000;
        }
        protected override String approverName() {
            return 'Manager';
        }
    }

    public class Director extends ApprovalHandler {
        protected override Boolean canApprove(Decimal amount) {
            return amount <= 10000;
        }
        protected override String approverName() {
            return 'Director';
        }
    }

    public class VicePresident extends ApprovalHandler {
        protected override Boolean canApprove(Decimal amount) {
            return amount <= 100000;
        }
        protected override String approverName() {
            return 'Vice President';
        }
    }

    public static void main() {
        ApprovalHandler manager = new Manager();
        ApprovalHandler director = new Director();
        ApprovalHandler vp = new VicePresident();
        manager.setNext(director).setNext(vp);

        manager.handle(500);
        manager.handle(5000);
        manager.handle(50000);
        manager.handle(500000);
    }
}
