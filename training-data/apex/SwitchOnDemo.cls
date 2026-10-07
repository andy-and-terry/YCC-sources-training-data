public class SwitchOnDemo {
    public static String describe(Object value) {
        switch on value {
            when null {
                return 'null value';
            }
            when Integer i {
                return 'Integer ' + i;
            }
            when String s {
                return 'String of length ' + s.length();
            }
            when Account a {
                return 'Account ' + a.Name;
            }
            when else {
                return 'Unknown type';
            }
        }
    }

    public static Integer daysIn(String month) {
        switch on month {
            when 'Feb' { return 28; }
            when 'Apr', 'Jun', 'Sep', 'Nov' { return 30; }
            when else { return 31; }
        }
    }

    public static void run() {
        System.debug(describe(42));
        System.debug(describe('hello'));
        System.debug(describe(new Account(Name = 'Acme')));
        System.debug(daysIn('Jun'));
    }
}
