public class SchemaDescribeFields {
    public static List<String> fieldNames(String objName) {
        Map<String, Schema.SObjectField> fields =
            Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        List<String> names = new List<String>(fields.keySet());
        names.sort();
        return names;
    }
}
