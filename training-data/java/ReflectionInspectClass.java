import java.lang.reflect.*;

public class ReflectionInspectClass {
    public static class Bean { private int n = 3; public String hi(String w) { return "hi " + w; } }

    public static void main(String[] args) throws Exception {
        Bean b = new Bean();
        Method m = Bean.class.getMethod("hi", String.class);
        System.out.println(m.invoke(b, "there"));
        Field f = Bean.class.getDeclaredField("n");
        f.setAccessible(true);
        f.setInt(b, 8);
        System.out.println(f.get(b) + " " + Modifier.isPrivate(f.getModifiers()));
    }
}
