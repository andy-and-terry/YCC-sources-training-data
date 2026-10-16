import java.util.Objects;
import java.util.function.Function;

public class GenericPairClass {
    static final class Pair<A, B> {
        final A first;
        final B second;

        Pair(A first, B second) {
            this.first = first;
            this.second = second;
        }

        <C> Pair<C, B> mapFirst(Function<? super A, ? extends C> f) {
            return new Pair<>(f.apply(first), second);
        }

        Pair<B, A> swap() {
            return new Pair<>(second, first);
        }

        @Override
        public boolean equals(Object o) {
            return o instanceof Pair<?, ?> p && Objects.equals(first, p.first) && Objects.equals(second, p.second);
        }

        @Override
        public int hashCode() {
            return Objects.hash(first, second);
        }

        @Override
        public String toString() {
            return "(" + first + ", " + second + ")";
        }
    }

    public static void main(String[] args) {
        Pair<String, Integer> p = new Pair<>("age", 30);
        System.out.println(p);
        System.out.println(p.swap());
        System.out.println(p.mapFirst(String::length));
        System.out.println(p.equals(new Pair<>("age", 30)));
    }
}
