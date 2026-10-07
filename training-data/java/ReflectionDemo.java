import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;

public class ReflectionDemo {
    static class Person {
        private String name = "Ann";
        public int age = 30;
        public String greet(String other) { return name + " greets " + other; }
    }

    public static void main(String[] args) throws Exception {
        Class<?> c = Person.class;
        System.out.println(c.getSimpleName());
        Arrays.stream(c.getDeclaredFields()).map(Field::getName).sorted().forEach(System.out::println);

        Person p = (Person) c.getDeclaredConstructor().newInstance();
        Method m = c.getMethod("greet", String.class);
        System.out.println(m.invoke(p, "Bob"));

        Field f = c.getDeclaredField("name");
        f.setAccessible(true);
        f.set(p, "Zed");
        System.out.println(f.get(p));
    }
}
