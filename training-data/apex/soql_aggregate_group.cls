public class AccountStats {
    public static Map<String, Integer> countByIndustry() {
        Map<String, Integer> out = new Map<String, Integer>();
        for (AggregateResult ar : [SELECT Industry ind, COUNT(Id) c FROM Account GROUP BY Industry]) {
            out.put((String) ar.get('ind'), (Integer) ar.get('c'));
        }
        return out;
    }
}
