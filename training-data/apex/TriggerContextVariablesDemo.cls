public class TriggerContextVariablesDemo {
    public static void handle(List<Account> newList, Map<Id, Account> oldMap) {
        if (Trigger.isBefore && Trigger.isUpdate) {
            for (Account a : newList) {
                Account old = oldMap.get(a.Id);
                if (a.Name != old.Name) {
                    a.Description = 'Renamed from ' + old.Name;
                }
            }
        }
    }
}
