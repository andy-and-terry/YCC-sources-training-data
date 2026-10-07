public class EnumWithAbstractMethodDemo {
    enum Operation {
        ADD {
            @Override
            int apply(int a, int b) {
                return a + b;
            }
        },
        SUBTRACT {
            @Override
            int apply(int a, int b) {
                return a - b;
            }
        },
        MULTIPLY {
            @Override
            int apply(int a, int b) {
                return a * b;
            }
        };

        abstract int apply(int a, int b);
    }

    public static void main(String[] args) {
        for (Operation op : Operation.values()) {
            System.out.println(op + "(6, 3) = " + op.apply(6, 3));
        }
    }
}
