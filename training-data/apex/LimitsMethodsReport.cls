public class LimitsMethodsReport {
    public static String report() {
        return 'SOQL ' + Limits.getQueries() + '/' + Limits.getLimitQueries()
            + ', DML ' + Limits.getDmlStatements() + '/' + Limits.getLimitDmlStatements()
            + ', CPU ' + Limits.getCpuTime() + '/' + Limits.getLimitCpuTime();
    }

    public static void main() {
        System.debug(report());
        List<Account> accts = [SELECT Id FROM Account LIMIT 1];
        System.debug(report());
    }
}
