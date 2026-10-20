import java.lang.annotation.*;
import java.lang.reflect.Method;

public class CustomAnnotationRuntime {
    @Retention(RetentionPolicy.RUNTIME) @Target(ElementType.METHOD) @interface Check { int times() default 1; }

    static class Suite {
        @Check(times = 2) public void a() { System.out.println("a"); }
        public void b() { System.out.println("b"); }
        @Check public void c() { System.out.println("c"); }
    }

    public static void main(String[] args) throws Exception {
        Suite s = new Suite();
        for (Method m : Suite.class.getDeclaredMethods()) {
            Check c = m.getAnnotation(Check.class);
            if (c != null) for (int i = 0; i < c.times(); i++) m.invoke(s);
        }
    }
}
