public class CollectionsMapsSetsLists {
    public static void demo() {
        List<Integer> nums = new List<Integer>{5, 3, 8, 1};
        nums.sort();
        nums.add(9);
        Set<String> tags = new Set<String>{'a', 'b'};
        tags.add('a');
        tags.addAll(new List<String>{'c', 'd'});
        Map<String, List<Integer>> grouped = new Map<String, List<Integer>>();
        for (Integer n : nums) {
            String key = Math.mod(n, 2) == 0 ? 'even' : 'odd';
            if (!grouped.containsKey(key)) grouped.put(key, new List<Integer>());
            grouped.get(key).add(n);
        }
        System.debug(nums + ' ' + tags.size() + ' ' + grouped.keySet());
        System.debug(nums.indexOf(8) + ' ' + nums.contains(3) + ' ' + nums.size());
        List<Integer> copy = nums.clone();
        copy.remove(0);
        System.debug(nums.size() + ' vs ' + copy.size());
        Map<Id, Account> byId = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 5]);
        System.debug(byId.values().size());
    }
}
