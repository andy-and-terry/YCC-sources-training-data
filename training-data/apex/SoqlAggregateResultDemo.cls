public with sharing class SoqlAggregateResultDemo {
    public static Map<String, Integer> countByIndustry() {
        Map<String, Integer> result = new Map<String, Integer>();
        for (AggregateResult ar : [
            SELECT Industry ind, COUNT(Id) cnt
            FROM Account
            WHERE Industry != null
            GROUP BY Industry
        ]) {
            result.put((String) ar.get('ind'), (Integer) ar.get('cnt'));
        }
        return result;
    }
}
