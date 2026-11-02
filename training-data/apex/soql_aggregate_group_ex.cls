public with sharing class SoqlAggregateGroupEx {
    public static Map<String, Decimal> revenueByIndustry() {
        Map<String, Decimal> out = new Map<String, Decimal>();
        for (AggregateResult ar : [SELECT Industry ind, SUM(AnnualRevenue) total FROM Account GROUP BY Industry]) {
            out.put((String) ar.get('ind'), (Decimal) ar.get('total'));
        }
        return out;
    }
}
