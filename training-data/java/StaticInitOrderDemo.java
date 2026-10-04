public class StaticInitOrderDemo {
    static class Base {
        static { System.out.println("Base static block"); }

        { System.out.println("Base instance block"); }

        Base() {
            System.out.println("Base constructor");
            hook();
        }

        void hook() { System.out.println("Base hook"); }
    }

    static class Child extends Base {
        static final String CONST = "compile-time constant";
        static { System.out.println("Child static block"); }

        private String field = "initialized";

        { System.out.println("Child instance block"); }

        Child() {
            super();
            System.out.println("Child constructor, field=" + field);
        }

        @Override
        void hook() { System.out.println("Child hook, field=" + field); }
    }

    public static void main(String[] args) {
        System.out.println("main start, " + Child.CONST);
        new Child();
        System.out.println("--- second instance ---");
        new Child();
    }
}
