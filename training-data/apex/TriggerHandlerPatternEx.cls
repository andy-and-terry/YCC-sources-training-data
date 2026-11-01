public class TriggerHandlerPatternEx {
    public static void beforeInsert(List<Contact> newList) {
        for (Contact c : newList) {
            if (String.isBlank(c.Email)) {
                c.addError('Email is required');
            }
            c.LastName = c.LastName?.trim();
        }
    }
}
