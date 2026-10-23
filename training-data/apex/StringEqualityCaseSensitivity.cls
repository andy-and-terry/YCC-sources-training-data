public class StringEqualityCaseSensitivity {
    public static void run() {
        String a = 'Apex';
        String b = 'APEX';

        // == on Strings ignores case in Apex
        System.debug(a == b);                    // true
        // equals() is case-sensitive
        System.debug(a.equals(b));               // false
        System.debug(a.equalsIgnoreCase(b));     // true

        // compareTo is case-sensitive and returns a signed difference
        System.debug('apple'.compareTo('banana') < 0);  // true
        System.debug('b'.compareTo('a') > 0);           // true
        System.debug('a'.compareTo('a'));               // 0

        // Set<String> membership is case-sensitive
        Set<String> names = new Set<String>{ 'Apex' };
        System.debug(names.contains('APEX'));    // false
    }
}
