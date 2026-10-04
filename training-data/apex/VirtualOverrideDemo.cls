public virtual class VirtualOverrideDemo {
    public virtual String greet() {
        return 'Hello from base';
    }

    public String describe() {
        return 'Says: ' + greet();
    }

    public class Friendly extends VirtualOverrideDemo {
        public override String greet() {
            return 'Hi friend! (' + super.greet() + ')';
        }
    }

    public class Formal extends VirtualOverrideDemo {
        public override String greet() {
            return 'Good day.';
        }
    }

    public static void main() {
        List<VirtualOverrideDemo> items = new List<VirtualOverrideDemo>{
            new VirtualOverrideDemo(), new Friendly(), new Formal()
        };
        for (VirtualOverrideDemo item : items) {
            System.debug(item.describe());
        }
    }
}
