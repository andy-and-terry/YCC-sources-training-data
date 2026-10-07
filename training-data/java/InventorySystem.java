import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class InventorySystem {
    record Product(String sku, String name, long priceCents, int reorderLevel) {}

    private final Map<String, Product> catalog = new LinkedHashMap<>();
    private final Map<String, Integer> stock = new LinkedHashMap<>();

    public void register(Product p) {
        catalog.put(p.sku(), p);
        stock.putIfAbsent(p.sku(), 0);
    }

    public void receive(String sku, int qty) {
        requireKnown(sku);
        stock.merge(sku, qty, Integer::sum);
    }

    public long sell(String sku, int qty) {
        requireKnown(sku);
        int have = stock.get(sku);
        if (have < qty) throw new IllegalStateException("only " + have + " of " + sku);
        stock.put(sku, have - qty);
        return qty * catalog.get(sku).priceCents();
    }

    public List<String> needsReorder() {
        return catalog.values().stream().filter(p -> stock.get(p.sku()) <= p.reorderLevel()).map(Product::name).toList();
    }

    public long valuationCents() {
        return catalog.values().stream().mapToLong(p -> p.priceCents() * stock.get(p.sku())).sum();
    }

    private void requireKnown(String sku) {
        if (!catalog.containsKey(sku)) throw new IllegalArgumentException("unknown sku " + sku);
    }

    public static void main(String[] args) {
        InventorySystem inv = new InventorySystem();
        inv.register(new Product("A1", "apple", 50, 10));
        inv.register(new Product("P1", "pear", 75, 5));
        inv.receive("A1", 40);
        inv.receive("P1", 8);
        long revenue = inv.sell("A1", 32) + inv.sell("P1", 2);
        System.out.printf("revenue=%.2f value=%.2f reorder=%s%n", revenue / 100.0, inv.valuationCents() / 100.0, inv.needsReorder());
    }
}
