public class DynamicSoqlQueryDemo {
    public static List<SObject> search(String objectApiName, String fieldApiName, String searchTerm) {
        String safeTerm = String.escapeSingleQuotes(searchTerm);
        String query = 'SELECT Id, Name FROM ' + objectApiName +
            ' WHERE ' + fieldApiName + ' LIKE \'%' + safeTerm + '%\' LIMIT 50';
        return Database.query(query);
    }

    public static List<SObject> buildFilteredQuery(String objectApiName, Map<String, Object> filters) {
        List<String> conditions = new List<String>();
        for (String field : filters.keySet()) {
            Object value = filters.get(field);
            if (value instanceof String) {
                conditions.add(field + ' = \'' + String.escapeSingleQuotes((String) value) + '\'');
            } else {
                conditions.add(field + ' = ' + value);
            }
        }

        String query = 'SELECT Id FROM ' + objectApiName;
        if (!conditions.isEmpty()) {
            query += ' WHERE ' + String.join(conditions, ' AND ');
        }
        return Database.query(query);
    }

    public static void main() {
        List<SObject> results = search('Account', 'Name', 'Acme');
        System.debug('Matches found: ' + results.size());
    }
}
