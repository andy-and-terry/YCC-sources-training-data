public class GovernorLimitsDemo {
    public static void reportUsage() {
        System.debug('SOQL queries used: ' + Limits.getQueries() + ' / ' + Limits.getLimitQueries());
        System.debug('DML statements used: ' + Limits.getDmlStatements() + ' / ' + Limits.getLimitDmlStatements());
        System.debug('CPU time used: ' + Limits.getCpuTime() + ' / ' + Limits.getLimitCpuTime());
        System.debug('Heap size used: ' + Limits.getHeapSize() + ' / ' + Limits.getLimitHeapSize());
    }

    public static Boolean isApproachingQueryLimit(Double thresholdPercent) {
        Integer used = Limits.getQueries();
        Integer maxAllowed = Limits.getLimitQueries();
        if (maxAllowed == 0) {
            return false;
        }
        return (Double.valueOf(used) / maxAllowed * 100) >= thresholdPercent;
    }

    public static void main() {
        reportUsage();
        System.debug('Approaching limit: ' + isApproachingQueryLimit(80));
    }
}
