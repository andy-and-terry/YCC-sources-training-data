public class SoqlAggregateQuery {
    public static Map<Id, Decimal> totalsByAccount() {
        Map<Id, Decimal> result = new Map<Id, Decimal>();
        for (AggregateResult ar : [
            SELECT AccountId a, SUM(Amount) total
            FROM Opportunity
            WHERE IsClosed = false
            GROUP BY AccountId
        ]) {
            result.put((Id) ar.get('a'), (Decimal) ar.get('total'));
        }
        return result;
    }
}
