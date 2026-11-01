public class SoqlRelationshipEx {
    public static void run() {
        for (Account a : [SELECT Name, (SELECT LastName FROM Contacts) FROM Account LIMIT 10]) {
            System.debug(a.Name + ' has ' + a.Contacts.size() + ' contacts');
        }
        List<Contact> cs = [SELECT Name, Account.Name FROM Contact WHERE Account.Industry = 'Tech' LIMIT 5];
        System.debug(cs);
    }
}
