public class SOSLSearchDemo {
    public static List<List<SObject>> search(String term) {
        return [
            FIND :term IN NAME FIELDS
            RETURNING Account(Id, Name), Contact(Id, LastName), Lead(Id, Company)
        ];
    }

    public static void main() {
        List<List<SObject>> results = search('Acme*');
        List<Account> accounts = (List<Account>) results[0];
        System.debug(accounts.size() + ' accounts found');
    }
}
