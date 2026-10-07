public class SwitchStatementDemo {
    public enum Season { WINTER, SPRING, SUMMER, FALL }

    public static String describe(Object value) {
        switch on value {
            when null {
                return 'null value';
            }
            when Integer i {
                return 'integer ' + i;
            }
            when String s {
                return 'string of length ' + s.length();
            }
            when Account a {
                return 'account ' + a.Name;
            }
            when else {
                return 'something else';
            }
        }
    }

    public static String weather(Season s) {
        switch on s {
            when WINTER, FALL { return 'cool'; }
            when SPRING { return 'mild'; }
            when else { return 'hot'; }
        }
    }

    public static void main() {
        System.debug(describe(42));
        System.debug(describe('apex'));
        System.debug(describe(new Account(Name = 'Acme')));
        System.debug(describe(null));
        System.debug(weather(Season.SPRING));
    }
}
