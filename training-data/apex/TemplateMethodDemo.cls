public class TemplateMethodDemo {
    public abstract class ReportGenerator {
        public String generate() {
            return header() + body() + footer();
        }
        protected virtual String header() {
            return '--- Report ---\n';
        }
        protected abstract String body();
        protected virtual String footer() {
            return '\n--- End ---';
        }
    }

    public class SalesReport extends ReportGenerator {
        protected override String body() {
            return 'Sales: $1000';
        }
    }

    public class InventoryReport extends ReportGenerator {
        protected override String body() {
            return 'Inventory: 250 units';
        }
    }

    public static void main() {
        ReportGenerator r1 = new SalesReport();
        ReportGenerator r2 = new InventoryReport();
        System.debug(r1.generate());
        System.debug(r2.generate());
    }
}
