public class SwitchStatementDemo {
    public enum Level { LOW, MEDIUM, HIGH }

    public static String describe(Object value) {
        switch on value {
            when null { return 'null'; }
            when Integer i { return 'Integer ' + i; }
            when String s { return 'String of length ' + s.length(); }
            when Boolean b { return 'Boolean ' + b; }
            when else { return 'Other'; }
        }
    }

    public static Integer weight(Level l) {
        switch on l {
            when LOW { return 1; }
            when MEDIUM, HIGH { return 10; }
            when else { return 0; }
        }
    }

    public static void main() {
        System.debug(describe(5));
        System.debug(describe('hello'));
        System.debug(describe(null));
        System.debug(weight(Level.HIGH));
    }
}
