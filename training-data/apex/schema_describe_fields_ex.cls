public class SchemaDescribeFieldsEx {
    public static List<String> fieldNames(String objName) {
        Map<String, Schema.SObjectField> fm = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        List<String> names = new List<String>(fm.keySet());
        names.sort();
        return names;
    }
}
