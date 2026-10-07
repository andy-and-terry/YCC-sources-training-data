import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class InnerClassTypesDemo {
    private final String label = "outer";
    private final List<Integer> data = new ArrayList<>(List.of(5, 6, 7));

    class Inner {
        String show() { return "inner sees " + label; }
    }

    static class Nested {
        String show() { return "nested has no outer instance"; }
    }

    Iterator<Integer> reverseIterator() {
        return new Iterator<>() {
            int pos = data.size() - 1;

            public boolean hasNext() { return pos >= 0; }

            public Integer next() { return data.get(pos--); }
        };
    }

    String localClassDemo() {
        class Local {
            String twice() { return label + label; }
        }
        return new Local().twice();
    }

    public static void main(String[] args) {
        InnerClassTypesDemo outer = new InnerClassTypesDemo();
        InnerClassTypesDemo.Inner inner = outer.new Inner();
        System.out.println(inner.show());
        System.out.println(new Nested().show());
        System.out.println(outer.localClassDemo());

        Iterator<Integer> it = outer.reverseIterator();
        while (it.hasNext()) {
            System.out.print(it.next() + " ");
        }
        System.out.println();
    }
}
