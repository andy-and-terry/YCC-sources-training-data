public class SOQLRelationshipQueryDemo {
    public static Map<Id, Integer> contactCounts() {
        Map<Id, Integer> counts = new Map<Id, Integer>();
        for (Account a : [SELECT Id, (SELECT Id FROM Contacts) FROM Account LIMIT 100]) {
            counts.put(a.Id, a.Contacts.size());
        }
        return counts;
    }

    public static List<String> contactAccountNames() {
        List<String> names = new List<String>();
        for (Contact c : [SELECT LastName, Account.Name FROM Contact WHERE AccountId != null LIMIT 50]) {
            names.add(c.LastName + ' @ ' + c.Account.Name);
        }
        return names;
    }
}
