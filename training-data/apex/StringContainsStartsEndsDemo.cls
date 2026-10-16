public class StringContainsStartsEndsDemo {
    public static void main() {
        String s = 'Salesforce Apex Language';
        System.debug(s.contains('Apex'));
        System.debug(s.startsWith('Sales'));
        System.debug(s.endsWith('age'));
        System.debug(s.indexOf('Apex'));
        System.debug(s.containsIgnoreCase('APEX'));
        System.debug(s.countMatches('a'));
    }
}
