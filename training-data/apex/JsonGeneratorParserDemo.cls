// Streaming JSON: build with JSONGenerator, read back token by token with JSONParser.
public class JsonGeneratorParserDemo {
    public static String build() {
        JSONGenerator gen = JSON.createGenerator(false);
        gen.writeStartObject();
        gen.writeStringField('name', 'Widget');
        gen.writeNumberField('qty', 12);
        gen.writeBooleanField('active', true);
        gen.writeFieldName('tags');
        gen.writeStartArray();
        gen.writeString('blue');
        gen.writeString('small');
        gen.writeEndArray();
        gen.writeEndObject();
        return gen.getAsString();
    }

    public static void main() {
        String json = build();
        System.debug(json);   // {"name":"Widget","qty":12,"active":true,"tags":["blue","small"]}

        JSONParser parser = JSON.createParser(json);
        Integer fieldCount = 0;
        List<String> tags = new List<String>();
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String field = parser.getText();
                parser.nextToken();   // move to the value
                fieldCount++;
                if (field == 'qty') {
                    System.debug('qty: ' + parser.getIntegerValue());
                } else if (field == 'tags') {
                    while (parser.nextToken() != JSONToken.END_ARRAY) {
                        tags.add(parser.getText());
                    }
                }
            }
        }
        System.debug('fields: ' + fieldCount);   // 4
        System.debug('tags: ' + tags);           // (blue, small)
    }
}
