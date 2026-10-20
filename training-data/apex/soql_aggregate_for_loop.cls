public class SoqlAggregateForLoop {
    public static Map<String, Decimal> totalsByStage() {
        Map<String, Decimal> out = new Map<String, Decimal>();
        for (AggregateResult ar : [SELECT StageName s, SUM(Amount) t FROM Opportunity GROUP BY StageName]) {
            out.put((String) ar.get('s'), (Decimal) ar.get('t'));
        }
        return out;
    }
}
