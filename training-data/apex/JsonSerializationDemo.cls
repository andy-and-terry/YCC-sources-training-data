public class JsonSerializationDemo {
    public class ContactData {
        public String name;
        public String email;
        public Integer age;

        public ContactData(String name, String email, Integer age) {
            this.name = name;
            this.email = email;
            this.age = age;
        }
    }

    public static String toJson(ContactData data) {
        return JSON.serialize(data);
    }

    public static ContactData fromJson(String jsonString) {
        return (ContactData) JSON.deserialize(jsonString, ContactData.class);
    }

    public static void main() {
        ContactData original = new ContactData('Ada Lovelace', 'ada@example.com', 36);
        String serialized = toJson(original);
        System.debug('Serialized: ' + serialized);

        ContactData parsed = fromJson(serialized);
        System.debug('Parsed name: ' + parsed.name);

        Map<String, Object> untyped = (Map<String, Object>) JSON.deserializeUntyped(serialized);
        System.debug('Untyped email: ' + untyped.get('email'));
    }
}
