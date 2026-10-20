public class SetMapCollectionsDemo {
    public static void run() {
        Set<String> seen = new Set<String>{'a', 'b'};
        seen.add('a');
        Map<Id, Account> byId = new Map<Id, Account>([SELECT Id FROM Account LIMIT 5]);
        System.debug(seen.size() + ' ' + byId.keySet().size());
    }
}
