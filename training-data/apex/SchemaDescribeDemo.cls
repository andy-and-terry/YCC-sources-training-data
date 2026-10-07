public class SchemaDescribeDemo {
    public static List<String> getFieldNames(String objectApiName) {
        Schema.DescribeSObjectResult describeResult = Schema.getGlobalDescribe().get(objectApiName).getDescribe();
        Map<String, Schema.SObjectField> fieldMap = describeResult.fields.getMap();
        List<String> fieldNames = new List<String>(fieldMap.keySet());
        fieldNames.sort();
        return fieldNames;
    }

    public static List<String> getPicklistValues(String objectApiName, String fieldApiName) {
        Schema.DescribeSObjectResult describeResult = Schema.getGlobalDescribe().get(objectApiName).getDescribe();
        Schema.DescribeFieldResult fieldResult = describeResult.fields.getMap().get(fieldApiName).getDescribe();

        List<String> values = new List<String>();
        for (Schema.PicklistEntry entry : fieldResult.getPicklistValues()) {
            if (entry.isActive()) {
                values.add(entry.getValue());
            }
        }
        return values;
    }

    public static void main() {
        System.debug(getFieldNames('Account'));
        System.debug(getPicklistValues('Opportunity', 'StageName'));
    }
}
