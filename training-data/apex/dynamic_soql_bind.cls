public class DynamicSoqlBind {
    public static List<Contact> byLastName(String name) {
        String q = 'SELECT Id, LastName FROM Contact WHERE LastName = :name LIMIT 50';
        return Database.query(q);
    }
}
