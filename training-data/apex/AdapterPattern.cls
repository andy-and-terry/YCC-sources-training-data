public class AdapterPattern {
    public interface JsonSerializer {
        String toJson(Object obj);
    }

    public class LegacyXmlFormatter {
        public String toXml(Map<String, Object> data) {
            String xml = '<record>';
            for (String key : data.keySet()) {
                xml += '<' + key + '>' + String.valueOf(data.get(key)) + '</' + key + '>';
            }
            xml += '</record>';
            return xml;
        }
    }

    public class XmlToJsonAdapter implements JsonSerializer {
        private LegacyXmlFormatter legacy = new LegacyXmlFormatter();

        public String toJson(Object obj) {
            Map<String, Object> data = (Map<String, Object>) obj;
            String xml = legacy.toXml(data);
            return '{"xmlPayload": "' + xml.replace('"', '\'') + '"}';
        }
    }

    public static void main() {
        Map<String, Object> data = new Map<String, Object>{ 'name' => 'Acme', 'id' => 1 };
        JsonSerializer serializer = new XmlToJsonAdapter();
        System.debug(serializer.toJson(data));
    }
}
