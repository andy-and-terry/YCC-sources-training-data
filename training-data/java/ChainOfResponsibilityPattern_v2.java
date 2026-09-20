public class ChainOfResponsibilityPattern_v2 {
    abstract static class Approver {
        protected Approver next;

        Approver setNext(Approver next) {
            this.next = next;
            return next;
        }

        abstract void approve(double amount);

        protected void forward(double amount) {
            if (next != null) {
                next.approve(amount);
            } else {
                System.out.println("No one could approve " + amount);
            }
        }
    }

    static class Manager extends Approver {
        void approve(double amount) {
            if (amount <= 1000) {
                System.out.println("Manager approved " + amount);
            } else {
                forward(amount);
            }
        }
    }

    static class Director extends Approver {
        void approve(double amount) {
            if (amount <= 5000) {
                System.out.println("Director approved " + amount);
            } else {
                forward(amount);
            }
        }
    }

    static class VicePresident extends Approver {
        void approve(double amount) {
            System.out.println("VP approved " + amount);
        }
    }

    public static void main(String[] args) {
        Approver manager = new Manager();
        Approver director = new Director();
        Approver vp = new VicePresident();
        manager.setNext(director).setNext(vp);

        for (double amount : new double[] {500, 3000, 9000}) {
            manager.approve(amount);
        }
    }
}
