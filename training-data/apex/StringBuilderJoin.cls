public class StringBuilderJoin {
    public static String csvLine(List<Object> cells) {
        List<String> parts = new List<String>();
        for (Object c : cells) {
            String s = String.valueOf(c);
            if (s.contains(',') || s.contains('"')) {
                s = '"' + s.replace('"', '""') + '"';
            }
            parts.add(s);
        }
        return String.join(parts, ',');
    }

    public static void main() {
        System.debug(csvLine(new List<Object>{ 'Ada', 36, 'a,b', 'say "hi"' }));
        System.debug('abc'.leftPad(6, '*'));
        System.debug(String.format('{0} has {1} items', new List<Object>{ 'Cart', 3 }));
        System.debug('a-b-c'.split('-'));
    }
}
