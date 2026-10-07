public class StringFormatDemo {
    public static void run() {
        System.debug(String.format('Hello {0}, you have {1} messages', new List<Object>{'Ann', 5}));
        System.debug(String.join(new List<String>{'a', 'b', 'c'}, '-'));
        System.debug('abc'.leftPad(6, '*'));
        System.debug('  trim me '.trim());
        System.debug('Hello'.reverse());
        System.debug('a,b,,c'.split(','));
        System.debug('Salesforce'.substringBefore('f'));
        System.debug('Salesforce'.substringAfter('f'));
        System.debug('banana'.countMatches('an'));
        System.debug('x'.repeat(3));
        System.debug(String.valueOf(3.14));
        System.debug('Apex'.equalsIgnoreCase('APEX'));
        System.debug('hello world'.capitalize());
        System.debug('abc'.compareTo('abd'));
    }
}
