public class RecordTypeInfoLookup {
    public static Id recordTypeId(String developerName) {
        Schema.RecordTypeInfo info = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get(developerName);
        return info == null ? null : info.getRecordTypeId();
    }

    public static void main() {
        System.debug(recordTypeId('Business_Account'));
    }
}
