class Order : Object {
    public enum State {
        NEW,
        PAID,
        SHIPPED;

        public string label () {
            switch (this) {
                case NEW: return "new";
                case PAID: return "paid";
                case SHIPPED: return "shipped";
                default: return "unknown";
            }
        }
    }

    public class Line : Object {
        public string sku;
        public int qty;
        public Line (string sku, int qty) {
            this.sku = sku;
            this.qty = qty;
        }
    }

    public State state = State.NEW;
    public List<Line> lines = new List<Line> ();

    public void advance () {
        if (state == State.NEW) {
            state = State.PAID;
        } else if (state == State.PAID) {
            state = State.SHIPPED;
        }
    }
}

void main () {
    var o = new Order ();
    o.lines.append (new Order.Line ("A-1", 2));
    o.lines.append (new Order.Line ("B-7", 1));
    o.advance ();
    stdout.printf ("%s with %u lines\n", o.state.label (), o.lines.length ());
}
