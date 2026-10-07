public class AggregateSoqlDemo {
    public static void main() {
        List<AggregateResult> results = [
            SELECT StageName, COUNT(Id) total, SUM(Amount) totalAmount
            FROM Opportunity
            GROUP BY StageName
        ];
        for (AggregateResult ar : results) {
            String stage = (String) ar.get('StageName');
            Integer total = (Integer) ar.get('total');
            Decimal totalAmount = (Decimal) ar.get('totalAmount');
            System.debug(stage + ': ' + total + ' opps, $' + totalAmount);
        }
    }
}
