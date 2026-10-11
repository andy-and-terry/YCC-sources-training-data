public class CustomMetadataTypeRead {
    public static Map<String, String> loadSettings() {
        Map<String, String> settings = new Map<String, String>();
        for (App_Setting__mdt row : [SELECT DeveloperName, Value__c FROM App_Setting__mdt]) {
            settings.put(row.DeveloperName, row.Value__c);
        }
        return settings;
    }

    public static String getSetting(String name, String fallback) {
        App_Setting__mdt row = App_Setting__mdt.getInstance(name);
        return row == null ? fallback : row.Value__c;
    }
}
