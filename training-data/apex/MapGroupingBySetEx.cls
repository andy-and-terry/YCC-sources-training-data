public class MapGroupingBySetEx {
    public static Map<String, List<Account>> groupByIndustry(List<Account> accts) {
        Map<String, List<Account>> out = new Map<String, List<Account>>();
        for (Account a : accts) {
            String key = a.Industry == null ? 'Unknown' : a.Industry;
            if (!out.containsKey(key)) {
                out.put(key, new List<Account>());
            }
            out.get(key).add(a);
        }
        return out;
    }
}
