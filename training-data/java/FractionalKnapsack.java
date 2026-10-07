import java.util.Comparator;
import java.util.List;

public class FractionalKnapsack {
    record Item(String name, double value, double weight) {
        double ratio() { return value / weight; }
    }

    public static double solve(List<Item> items, double capacity) {
        double total = 0;
        for (Item it : items.stream().sorted(Comparator.comparingDouble(Item::ratio).reversed()).toList()) {
            if (capacity <= 0) break;
            double take = Math.min(it.weight(), capacity);
            total += it.value() * take / it.weight();
            capacity -= take;
            System.out.printf("take %.1f of %s (%.0f%%)%n", take, it.name(), 100 * take / it.weight());
        }
        return total;
    }

    public static void main(String[] args) {
        double v = solve(List.of(new Item("gold", 60, 10), new Item("silver", 100, 20), new Item("bronze", 120, 30)), 50);
        System.out.println("total value: " + v);
    }
}
