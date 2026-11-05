public class SchemaDescribeFieldsDemo {
    public static List<String> requiredFields(String objectName) {
        List<String> names = new List<String>();
        Schema.SObjectType t = Schema.getGlobalDescribe().get(objectName);
        Map<String, Schema.SObjectField> fields = t.getDescribe().fields.getMap();
        for (String f : fields.keySet()) {
            Schema.DescribeFieldResult d = fields.get(f).getDescribe();
            if (!d.isNillable() && d.isCreateable()) {
                names.add(d.getName());
            }
        }
        return names;
    }
}
