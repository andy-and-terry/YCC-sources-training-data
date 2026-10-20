public class SoqlAggregateGroupBy {
    public static Map<String, Decimal> revenueByStage(Set<Id> accountIds) {
        Map<String, Decimal> result = new Map<String, Decimal>();
        for (AggregateResult ar : [
            SELECT StageName stage, SUM(Amount) total, COUNT(Id) cnt
            FROM Opportunity
            WHERE AccountId IN :accountIds AND Amount != null
            GROUP BY StageName
            HAVING SUM(Amount) > 0
            ORDER BY SUM(Amount) DESC
        ]) {
            result.put((String) ar.get('stage'), (Decimal) ar.get('total'));
        }
        return result;
    }
}
