import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class ReflectionDemo {
    static class Person {
        private String name;
        public int age;

        public Person(String name, int age) {
            this.name = name;
            this.age = age;
        }

        public String greet(String other) {
            return name + " greets " + other;
        }
    }

    public static void main(String[] args) throws Exception {
        Class<?> cls = Person.class;
        for (Field f : cls.getDeclaredFields()) {
            System.out.println("field " + Modifier.toString(f.getModifiers()) + " " + f.getType().getSimpleName() + " " + f.getName());
        }

        Constructor<?> ctor = cls.getConstructor(String.class, int.class);
        Object p = ctor.newInstance("Ada", 36);

        Method m = cls.getMethod("greet", String.class);
        System.out.println(m.invoke(p, "Bob"));

        Field name = cls.getDeclaredField("name");
        name.setAccessible(true);
        name.set(p, "Grace");
        System.out.println(name.get(p));
    }
}
