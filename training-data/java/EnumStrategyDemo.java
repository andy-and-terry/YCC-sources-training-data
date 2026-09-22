public class EnumStrategyDemo {
    enum Operation {
        ADD {
            @Override
            public int apply(int a, int b) {
                return a + b;
            }
        },
        SUBTRACT {
            @Override
            public int apply(int a, int b) {
                return a - b;
            }
        },
        MULTIPLY {
            @Override
            public int apply(int a, int b) {
                return a * b;
            }
        };

        public abstract int apply(int a, int b);
    }

    public static void main(String[] args) {
        for (Operation op : Operation.values()) {
            System.out.println(op + ": " + op.apply(6, 3));
        }
    }
}
