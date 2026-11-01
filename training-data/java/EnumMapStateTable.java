import java.util.EnumMap;

public class EnumMapStateTable {
    enum Light { RED, GREEN, YELLOW }

    public static void main(String[] args) {
        EnumMap<Light, Light> next = new EnumMap<>(Light.class);
        next.put(Light.RED, Light.GREEN);
        next.put(Light.GREEN, Light.YELLOW);
        next.put(Light.YELLOW, Light.RED);
        Light cur = Light.RED;
        for (int i = 0; i < 5; i++) {
            System.out.println(cur);
            cur = next.get(cur);
        }
    }
}
