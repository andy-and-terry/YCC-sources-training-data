public class ContactTriggerHandler {
    public static void beforeInsert(List<Contact> news) {
        for (Contact c : news) {
            if (String.isBlank(c.Email)) {
                c.addError('Email is required');
            }
        }
    }
}
