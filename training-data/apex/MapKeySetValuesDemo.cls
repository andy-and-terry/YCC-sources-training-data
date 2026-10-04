public class MapKeySetValuesDemo {
    public static void main() {
        Map<String, Integer> stock = new Map<String, Integer>{
            'widget' => 10,
            'gadget' => 0,
            'doohickey' => 4
        };

        List<String> names = new List<String>(stock.keySet());
        names.sort();
        System.debug('sorted keys: ' + names);

        Integer total = 0;
        for (Integer qty : stock.values()) {
            total += qty;
        }
        System.debug('total units: ' + total);

        stock.put('gadget', stock.get('gadget') + 25);
        stock.remove('doohickey');
        System.debug('has doohickey? ' + stock.containsKey('doohickey'));
        System.debug('size: ' + stock.size());
        System.debug('missing key returns: ' + stock.get('nothing'));
    }
}
