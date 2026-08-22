import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class StreamsDemo {
    record Employee(String name, String department, double salary) {}

    public static void main(String[] args) {
        List<Employee> employees = List.of(
            new Employee("Alice", "Engineering", 95000),
            new Employee("Bob", "Sales", 65000),
            new Employee("Carol", "Engineering", 105000),
            new Employee("Dave", "Sales", 70000)
        );

        Map<String, Double> avgSalaryByDept = employees.stream()
            .collect(Collectors.groupingBy(Employee::department, Collectors.averagingDouble(Employee::salary)));
        System.out.println(avgSalaryByDept);

        List<String> highEarners = employees.stream()
            .filter(e -> e.salary() > 80000)
            .map(Employee::name)
            .sorted()
            .collect(Collectors.toList());
        System.out.println(highEarners);

        double totalPayroll = employees.stream().mapToDouble(Employee::salary).sum();
        System.out.println(totalPayroll);
    }
}
