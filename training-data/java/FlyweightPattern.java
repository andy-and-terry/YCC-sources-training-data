import java.util.HashMap;
import java.util.Map;

public class FlyweightPattern {
    // Intrinsic (shared) state lives on the flyweight; extrinsic state is
    // passed in at render time instead of being duplicated per instance.
    static final class TreeType {
        private final String name;
        private final String color;
        private final String texture;

        TreeType(String name, String color, String texture) {
            this.name = name;
            this.color = color;
            this.texture = texture;
        }

        void render(int x, int y) {
            System.out.printf("%s tree (%s, %s) drawn at (%d, %d)%n", name, color, texture, x, y);
        }
    }

    static final class TreeTypeFactory {
        private final Map<String, TreeType> cache = new HashMap<>();

        TreeType get(String name, String color, String texture) {
            String key = name + "-" + color + "-" + texture;
            return cache.computeIfAbsent(key, k -> new TreeType(name, color, texture));
        }

        int cachedTypeCount() {
            return cache.size();
        }
    }

    record Tree(int x, int y, TreeType type) {
        void render() {
            type.render(x, y);
        }
    }

    public static void main(String[] args) {
        TreeTypeFactory factory = new TreeTypeFactory();
        Tree[] forest = {
            new Tree(1, 1, factory.get("Oak", "Green", "Rough")),
            new Tree(2, 5, factory.get("Oak", "Green", "Rough")),
            new Tree(8, 3, factory.get("Pine", "Dark Green", "Needled")),
            new Tree(9, 9, factory.get("Oak", "Green", "Rough")),
        };

        for (Tree tree : forest) {
            tree.render();
        }
        System.out.println("distinct tree types created: " + factory.cachedTypeCount());
    }
}
