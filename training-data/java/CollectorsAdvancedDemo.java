import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CollectorsAdvancedDemo {
    record Product(String name, String category, double price) {}

    public static void main(String[] args) {
        List<Product> products = List.of(
            new Product("Laptop", "Electronics", 1200.0),
            new Product("Phone", "Electronics", 800.0),
            new Product("Desk", "Furniture", 350.0),
            new Product("Chair", "Furniture", 150.0),
            new Product("Monitor", "Electronics", 300.0)
        );

        Map<Boolean, List<Product>> partitioned = products.stream()
            .collect(Collectors.partitioningBy(p -> p.price() > 500));
        System.out.println("expensive: " + partitioned.get(true).size());
        System.out.println("affordable: " + partitioned.get(false).size());

        Map<String, Double> cheapestByCategory = products.stream()
            .collect(Collectors.toMap(
                Product::category,
                Product::price,
                Math::min
            ));
        System.out.println(cheapestByCategory);

        String summary = products.stream()
            .map(Product::name)
            .collect(Collectors.joining(", ", "[", "]"));
        System.out.println(summary);

        Map<String, Long> countByCategory = products.stream()
            .collect(Collectors.groupingBy(Product::category, Collectors.counting()));
        System.out.println(countByCategory);
    }
}
