public abstract class AbstractClassTemplate {
    public abstract String name();

    public String greet() {
        return 'Hello from ' + name();
    }

    public class English extends AbstractClassTemplate {
        public override String name() { return 'English'; }
    }

    public class French extends AbstractClassTemplate {
        public override String name() { return 'Francais'; }
    }

    public static void main() {
        List<AbstractClassTemplate> items = new List<AbstractClassTemplate>{
            new English(), new French()
        };
        for (AbstractClassTemplate t : items) {
            System.debug(t.greet());
        }
    }
}
