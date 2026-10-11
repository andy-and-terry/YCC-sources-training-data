public class IdPrefixKeyDetection {
    public static String objectNameFor(Id recordId) {
        return recordId.getSObjectType().getDescribe().getName();
    }

    public static Boolean isAccount(Id recordId) {
        return String.valueOf(recordId).startsWith('001');
    }

    public static void main() {
        Id fake = '001000000000001AAA';
        System.debug(isAccount(fake));
        System.debug(objectNameFor(fake));
    }
}
