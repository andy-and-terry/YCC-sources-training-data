import java.util.*;

public class ObjectEqualsHashCodeContract {
    static final class Key {
        final String a; final int b;
        Key(String a, int b) { this.a = a; this.b = b; }
        @Override public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Key k)) return false;
            return b == k.b && a.equals(k.a);
        }
        @Override public int hashCode() { return Objects.hash(a, b); }
    }

    public static void main(String[] args) {
        Set<Key> s = new HashSet<>();
        s.add(new Key("x", 1)); s.add(new Key("x", 1));
        System.out.println(s.size());
    }
}
