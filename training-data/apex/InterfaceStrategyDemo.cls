public class InterfaceStrategyDemo {
    public interface Discount {
        Decimal apply(Decimal price);
    }

    public class TenPercent implements Discount {
        public Decimal apply(Decimal price) { return price * 0.9; }
    }

    public class Flat implements Discount {
        public Decimal apply(Decimal price) { return price - 5; }
    }

    public static Decimal total(Decimal price, Discount d) {
        return d.apply(price);
    }
}
