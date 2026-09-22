import java.util.Comparator;
import java.util.List;

public class ComparatorChainingDemo {
    record Person(String lastName, String firstName, int age) {}

    public static void main(String[] args) {
        List<Person> people = new java.util.ArrayList<>(List.of(
            new Person("Smith", "Anna", 30),
            new Person("Smith", "Ben", 25),
            new Person("Doe", "Zoe", 40),
            new Person("Doe", "Amy", 40)
        ));

        Comparator<Person> byLastThenFirst = Comparator
            .comparing(Person::lastName)
            .thenComparing(Person::firstName);
        people.sort(byLastThenFirst);
        people.forEach(System.out::println);

        Comparator<Person> byAgeDescThenLastAsc = Comparator
            .comparingInt(Person::age)
            .reversed()
            .thenComparing(Person::lastName);
        people.sort(byAgeDescThenLastAsc);
        System.out.println("---");
        people.forEach(System.out::println);
    }
}
