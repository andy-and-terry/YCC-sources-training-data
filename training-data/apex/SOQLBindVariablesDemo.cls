public class SOQLBindVariablesDemo {
    public static List<Account> findByIndustries(Set<String> industries, Decimal minRevenue) {
        return [
            SELECT Id, Name, Industry, AnnualRevenue
            FROM Account
            WHERE Industry IN :industries AND AnnualRevenue >= :minRevenue
            ORDER BY AnnualRevenue DESC
            LIMIT 20
        ];
    }

    public static Integer countByName(String prefix) {
        String pattern = prefix + '%';
        return [SELECT COUNT() FROM Account WHERE Name LIKE :pattern];
    }
}
