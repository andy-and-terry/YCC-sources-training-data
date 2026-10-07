import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class CollectorsTeeingDemo {
    record Order(String customer, String item, int quantity, double price) {}

    public static void main(String[] args) {
        List<Order> orders = List.of(
            new Order("Ada", "Widget", 3, 9.5),
            new Order("Ada", "Gadget", 1, 25.0),
            new Order("Bob", "Widget", 5, 9.5),
            new Order("Bob", "Gizmo", 2, 15.0),
            new Order("Cid", "Gadget", 4, 25.0)
        );

        double averageOrderValue = orders.stream()
            .collect(Collectors.teeing(
                Collectors.summingDouble(o -> o.quantity() * o.price()),
                Collectors.counting(),
                (total, count) -> total / count
            ));
        System.out.printf("average order value: %.2f%n", averageOrderValue);

        Map<String, Set<String>> itemsByCustomer = orders.stream()
            .collect(Collectors.groupingBy(Order::customer, Collectors.mapping(Order::item, Collectors.toSet())));
        System.out.println(itemsByCustomer);

        Map<String, Double> revenueByItem = orders.stream()
            .collect(Collectors.groupingBy(Order::item, Collectors.summingDouble(o -> o.quantity() * o.price())));
        System.out.println(revenueByItem);

        List<String> itemsFlattened = orders.stream()
            .flatMap(o -> java.util.stream.Stream.generate(o::item).limit(o.quantity()))
            .distinct()
            .sorted()
            .toList();
        System.out.println(itemsFlattened);
    }
}
