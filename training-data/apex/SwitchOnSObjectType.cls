public class SwitchOnSObjectType {
    public static String kind(SObject record) {
        switch on record {
            when Account a { return 'Account ' + a.Name; }
            when Contact c { return 'Contact ' + c.LastName; }
            when else      { return 'Other'; }
        }
    }

    public static void run() {
        System.debug(kind(new Account(Name = 'Acme')));
        System.debug(kind(new Contact(LastName = 'Smith')));
        System.debug(kind(new Lead(LastName = 'Jones', Company = 'X')));
    }
}
