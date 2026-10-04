public class SwitchStatementDemo {
    public enum Level { LOW, MEDIUM, HIGH }

    public static String describeInt(Integer n) {
        switch on n {
            when 0 { return 'zero'; }
            when 1, 2, 3 { return 'small'; }
            when 4, 5, 6 { return 'medium'; }
            when else { return 'large'; }
        }
    }

    public static String describeLevel(Level l) {
        switch on l {
            when LOW { return 'relax'; }
            when MEDIUM { return 'watch'; }
            when HIGH { return 'act now'; }
        }
        return null;
    }

    public static String describeObject(Object o) {
        switch on o {
            when Integer i { return 'Integer ' + (i + 1); }
            when String s { return 'String of length ' + s.length(); }
            when List<Object> l { return 'List of ' + l.size(); }
            when null { return 'null value'; }
            when else { return 'something else'; }
        }
    }

    public static void main() {
        System.debug(describeInt(2));
        System.debug(describeInt(99));
        System.debug(describeLevel(Level.HIGH));
        System.debug(describeObject(41));
        System.debug(describeObject('apex'));
        System.debug(describeObject(new List<Object>{1, 2}));
        System.debug(describeObject(null));
    }
}
