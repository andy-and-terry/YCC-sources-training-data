public class AdapterPattern {
    // The interface our client code expects.
    public interface JsonExporter {
        String toJson();
    }

    // A third-party-style class we cannot change, exposing an
    // incompatible XML-shaped API.
    public class LegacyXmlReport {
        public String toXmlString() {
            return '<report><total>42</total></report>';
        }
    }

    // Adapter: makes LegacyXmlReport conform to JsonExporter by wrapping
    // it and translating its output.
    public class XmlToJsonAdapter implements JsonExporter {
        private LegacyXmlReport legacy;
        public XmlToJsonAdapter(LegacyXmlReport legacy) {
            this.legacy = legacy;
        }
        public String toJson() {
            String xml = legacy.toXmlString();
            String total = xml.substringBetween('<total>', '</total>');
            return '{"total":' + total + '}';
        }
    }

    public static void main() {
        JsonExporter exporter = new XmlToJsonAdapter(new LegacyXmlReport());
        System.debug(exporter.toJson());
    }
}
