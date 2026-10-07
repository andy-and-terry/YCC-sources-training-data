public class SObjectDynamicFieldsDemo {
    public static void main() {
        Account acc = new Account(Name = 'Acme', Industry = 'Tech');

        // Generic field access by name
        acc.put('Description', 'Created dynamically');
        System.debug(acc.get('Name'));
        System.debug(acc.get('Description'));
        System.debug(acc.isSet('Phone'));

        // Build an SObject from a type name
        SObject generic = Schema.getGlobalDescribe().get('Contact').newSObject();
        generic.put('LastName', 'Smith');
        System.debug(generic.getSObjectType());
        System.debug(generic);

        // Copy a field value between records using field name strings
        List<String> fields = new List<String>{'Name', 'Industry'};
        Account copy = new Account();
        for (String f : fields) {
            copy.put(f, acc.get(f));
        }
        System.debug(copy);

        // getPopulatedFieldsAsMap lists only the fields that were set
        Map<String, Object> populated = acc.getPopulatedFieldsAsMap();
        System.debug(populated.keySet());

        // Clone with a different Id state
        Account twin = acc.clone(false, true);
        twin.Name = 'Acme Twin';
        System.debug(acc.Name + ' / ' + twin.Name);
    }
}
