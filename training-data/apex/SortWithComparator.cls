public class SortWithComparator {
    public class Person {
        public String name;
        public Integer age;
        public Person(String name, Integer age) {
            this.name = name;
            this.age = age;
        }
    }

    public class AgeDescending implements System.Comparator<Person> {
        public Integer compare(Person a, Person b) {
            return b.age - a.age;
        }
    }

    public static void main() {
        List<Person> people = new List<Person>{
            new Person('Ann', 31), new Person('Bo', 45), new Person('Cy', 28)
        };
        people.sort(new AgeDescending());
        for (Person p : people) {
            System.debug(p.name + ' (' + p.age + ')');
        }
    }
}
