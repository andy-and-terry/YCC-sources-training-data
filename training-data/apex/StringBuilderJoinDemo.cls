public class StringBuilderJoinDemo {
    public static String repeat(String s, Integer times) {
        List<String> parts = new List<String>();
        for (Integer i = 0; i < times; i++) {
            parts.add(s);
        }
        return String.join(parts, '-');
    }

    public static String csvRow(List<Object> values) {
        List<String> cells = new List<String>();
        for (Object v : values) {
            String cell = String.valueOf(v);
            if (cell.contains(',')) {
                cell = '"' + cell + '"';
            }
            cells.add(cell);
        }
        return String.join(cells, ',');
    }

    public static void main() {
        System.debug(repeat('ab', 3));
        System.debug(csvRow(new List<Object>{'Acme, Inc', 42, true}));
        System.debug('abc'.leftPad(6, '*') + ' ' + 'abc'.rightPad(6, '*'));
    }
}
