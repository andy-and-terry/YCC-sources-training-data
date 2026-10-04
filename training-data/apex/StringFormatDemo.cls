public class StringFormatDemo {
    public static void main() {
        String msg = String.format('Hello {0}, you have {1} new messages', new List<Object>{'Ann', 5});
        System.debug(msg);

        System.debug(String.valueOf(3.14159));
        System.debug('abc'.leftPad(6, '*'));
        System.debug('abc'.rightPad(6, '-') + '|');
        System.debug('Salesforce'.abbreviate(8));
        System.debug('  trim me  '.trim() + '|');
        System.debug('a,b,,c'.split(','));
        System.debug('apex'.capitalize());
        System.debug('Hello'.contains('ell') + ' ' + 'Hello'.startsWith('He') + ' ' + 'Hello'.endsWith('lo'));
        System.debug('banana'.indexOf('an') + ' ' + 'banana'.lastIndexOf('an'));
        System.debug('banana'.replace('an', 'AN'));
        System.debug('x'.repeat(5));
        System.debug('Hello'.reverse());
        System.debug('a-b-c'.substringAfterLast('-') + ' ' + 'a-b-c'.substringBefore('-'));
        System.debug('abc'.compareTo('abd'));
        System.debug('Hello'.equalsIgnoreCase('HELLO'));
        System.debug('hello world'.countMatches('o'));
        System.debug(String.isNotBlank('  '));
    }
}
