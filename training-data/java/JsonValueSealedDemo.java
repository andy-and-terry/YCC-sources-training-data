import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class JsonValueSealedDemo {
    sealed interface JsonValue permits JsonString, JsonNumber, JsonBool, JsonNull, JsonArray, JsonObject {}

    record JsonString(String value) implements JsonValue {}
    record JsonNumber(double value) implements JsonValue {}
    record JsonBool(boolean value) implements JsonValue {}
    record JsonNull() implements JsonValue {}
    record JsonArray(List<JsonValue> items) implements JsonValue {}
    record JsonObject(Map<String, JsonValue> fields) implements JsonValue {}

    static String stringify(JsonValue value) {
        return switch (value) {
            case JsonString s -> "\"" + s.value() + "\"";
            case JsonNumber n -> String.valueOf(n.value());
            case JsonBool b -> String.valueOf(b.value());
            case JsonNull ignored -> "null";
            case JsonArray a -> a.items().stream()
                .map(JsonValueSealedDemo::stringify)
                .collect(Collectors.joining(",", "[", "]"));
            case JsonObject o -> o.fields().entrySet().stream()
                .map(e -> "\"" + e.getKey() + "\":" + stringify(e.getValue()))
                .collect(Collectors.joining(",", "{", "}"));
        };
    }

    public static void main(String[] args) {
        JsonValue doc = new JsonObject(Map.of(
            "name", new JsonString("Ada"),
            "age", new JsonNumber(36),
            "active", new JsonBool(true),
            "tags", new JsonArray(List.of(new JsonString("math"), new JsonString("engineer"))),
            "manager", new JsonNull()
        ));

        System.out.println(stringify(new JsonArray(List.of(new JsonNumber(1), new JsonNumber(2), new JsonBool(false)))));
        System.out.println(stringify(new JsonObject(Map.of("ok", new JsonBool(true)))));
        System.out.println(stringify(doc).contains("\"name\":\"Ada\""));
    }
}
