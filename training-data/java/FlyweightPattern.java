import java.util.HashMap;
import java.util.Map;

public class FlyweightPattern {
    static class TreeType {
        final String name;
        final String color;
        final String texture;

        TreeType(String name, String color, String texture) {
            this.name = name;
            this.color = color;
            this.texture = texture;
        }

        void render(int x, int y) {
            System.out.println("rendering " + name + " (" + color + ", " + texture + ") at (" + x + "," + y + ")");
        }
    }

    static class TreeTypeFactory {
        private final Map<String, TreeType> cache = new HashMap<>();

        TreeType get(String name, String color, String texture) {
            String key = name + "|" + color + "|" + texture;
            return cache.computeIfAbsent(key, k -> {
                System.out.println("creating new TreeType for " + key);
                return new TreeType(name, color, texture);
            });
        }

        int typeCount() {
            return cache.size();
        }
    }

    static class Tree {
        int x;
        int y;
        TreeType type;

        Tree(int x, int y, TreeType type) {
            this.x = x;
            this.y = y;
            this.type = type;
        }

        void render() {
            type.render(x, y);
        }
    }

    public static void main(String[] args) {
        TreeTypeFactory factory = new TreeTypeFactory();
        Tree[] forest = {
            new Tree(1, 1, factory.get("Oak", "green", "rough")),
            new Tree(2, 5, factory.get("Oak", "green", "rough")),
            new Tree(8, 3, factory.get("Pine", "dark-green", "needled")),
            new Tree(4, 9, factory.get("Oak", "green", "rough")),
        };

        for (Tree tree : forest) {
            tree.render();
        }
        System.out.println("distinct tree types created: " + factory.typeCount());
        System.out.println("trees placed: " + forest.length);
    }
}
