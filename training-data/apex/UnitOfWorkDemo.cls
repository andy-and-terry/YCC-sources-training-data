public class UnitOfWorkDemo {
    private Map<Schema.SObjectType, List<SObject>> newRecordsByType = new Map<Schema.SObjectType, List<SObject>>();
    private List<SObject> dirtyRecords = new List<SObject>();

    public void registerNew(SObject record) {
        Schema.SObjectType sObjType = record.getSObjectType();
        if (!newRecordsByType.containsKey(sObjType)) {
            newRecordsByType.put(sObjType, new List<SObject>());
        }
        newRecordsByType.get(sObjType).add(record);
    }

    public void registerDirty(SObject record) {
        dirtyRecords.add(record);
    }

    public void commitWork() {
        for (Schema.SObjectType sObjType : newRecordsByType.keySet()) {
            insert newRecordsByType.get(sObjType);
        }
        if (!dirtyRecords.isEmpty()) {
            update dirtyRecords;
        }
        newRecordsByType.clear();
        dirtyRecords.clear();
    }

    public static void main() {
        UnitOfWorkDemo uow = new UnitOfWorkDemo();
        Account acc = new Account(Name = 'New Co');
        uow.registerNew(acc);
        uow.commitWork();
        System.debug('Committed new account: ' + acc.Name);
    }
}
